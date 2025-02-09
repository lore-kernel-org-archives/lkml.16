Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1C1DF973
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 15:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739116759; cv=none; b=ger3xWPOFFiVn1H1RMUCa0tx6KSu0hCPDkO65BnWKFM1y2mI7vCc0+FKkN5Rx/ZE+697yNCTjHCY4i7mNQxkovrc0PScIh3K0nMAHRaMcPNXtN38bsOSIuo4SRX5uYHVHFy+c/JL14ecZrvPLNl8u7BG7XMj8Jgu+KctJU7CF9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739116759; c=relaxed/simple;
	bh=DtqWNuz+jd2orMzRksvcSnQxA8CIBjKxEBA+C5WGsoU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VzGVtjnz3Fy+9XfU+x+Xm2trO6BfLGTqtaFJTEbMB5MFTAgPkr4lh5LH9XmiG48b4ieo1z0i0uuscn/sTQVDDuJplANkp8ooXb/Ec0ZmAtSaxNkqr4JVLLCaCMEY7EjUVdijwn3FMhh21erd2+HLBvEOuPdsmrvU4gPfUU4XWDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Gp9fX9MK; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Gp9fX9MK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739116749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zgBjIgR08S1bqdf0ZVRzSx3TRTz1LEcmp7APZbqF590=;
	b=Gp9fX9MKmB0nZlZosgWVQQD4U97hwDNaLD/TaTOHJSY9TwD7Pb+N9j65yuoTP+o9iUchyT
	Vhcp4w7rGChcMQR6dhs1ELedI+YthqPljhGAbMnyj+MaZZOw/cupFIlBydR9WOBaGIEDR8
	9Qktdfx8qCSDM/9qVG7dVOOJpJXh5c8=
From: Wen Yang <wen.yang@linux.dev>
To: Joel Granados <j.granados@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: "Eric W . Biederman" <ebiederm@xmission.com>,
	Dave Young <dyoung@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH v5 0/5] sysctl: encode the min/max values directly in the table entry
Date: Sun,  9 Feb 2025 23:58:08 +0800
Message-Id: <cover.1739115369.git.wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Many modules use these additional static/global variables (such as
two_five_five, n_65535, ue_int_max, etc.) in the boundary checking of
sysctl, and they are read-only and never changed.

Eric points out: 

- One of the things that happens and that is worth acknowledging is there
- is code that wraps proc_doulongvec_minmax and proc_dointvec_minmax.
- Having the minmax information separate from the data pointer makes that
- wrapping easier.

- Further the min/max information is typically separate from other kinds
- of data.  So even when not wrapped it is nice just to take a quick
- glance and see what the minimums and maximums are.

- My original suggest was that we change struct ctl_table from:

- > /* A sysctl table is an array of struct ctl_table: */
- > struct ctl_table {
- > 	const char *procname;		/* Text ID for /proc/sys */
- > 	void *data;
- > 	int maxlen;
- > 	umode_t mode;
- > 	proc_handler *proc_handler;	/* Callback for text formatting */
- > 	struct ctl_table_poll *poll;
- > 	void *extra1;
- > 	void *extra2;
- > } __randomize_layout;

- to:

- > /* A sysctl table is an array of struct ctl_table: */
- > struct ctl_table {
- > 	const char *procname;		/* Text ID for /proc/sys */
- > 	void *data;
- > 	int maxlen;
- > 	umode_t mode;
- > 	proc_handler *proc_handler;	/* Callback for text formatting */
- > 	struct ctl_table_poll *poll;
- >       unsigned long min;
- >       unsigned long max;
- > } __randomize_layout;

- That is just replace extra1 and extra2 with min and max members.  The
- members don't have any reason to be pointers.  Without being pointers
- the min/max functions can just use long values to cap either ints or
- longs, and there is no room for error.  The integer promotion rules
- will ensure that even negative values can be stored in unsigned long
- min and max values successfully.  Plus it is all bog standard C
- so there is nothing special to learn.

- There are a bunch of fiddly little details to transition from where we
- are today.  The most straightforward way I can see of making the
- transition is to add the min and max members.  Come up with replacements
- for proc_doulongvec_minmax and proc_dointvec_minmax that read the new
- min and max members.  Update all of the users.  Update the few users
- that use extra1 or extra2 for something besides min and max.  Then
- remove extra1 and extra2.  At the end it is simpler and requires the
- same or a little less space.

This patch series achieves direct encoding min/max values in table entries
and still maintains compatibility with existing extra1/extra2 pointers.
Afterwards, we can remove these unnecessary static variables progressively and
also finally kill the shared const array.

v4: https://lore.kernel.org/all/20241201140058.5653-1-wen.yang@linux.dev/
v3: https://lore.kernel.org/all/cover.1726365007.git.wen.yang@linux.dev/
v2: https://lore.kernel.org/all/tencent_143077FB953D8B549153BB07F54C5AA4870A@qq.com/
v1: https://lore.kernel.org/all/tencent_95D22FF919A42A99DA3C886B322CBD983905@qq.com/

and
https://lore.kernel.org/all/20250105152853.211037-1-wen.yang@linux.dev/

Wen Yang (5):
  sysctl: simplify the min/max boundary check
  sysctl: add helper functions to extract table->extra1/extra2
  sysctl: support encoding values directly in the table entry
  sysctl: add kunit test code to check the min/max encoding of sysctl
    table entries
  sysctl: delete six_hundred_forty_kb to save 4 bytes

 fs/proc/proc_sysctl.c  |  35 ++-
 include/linux/sysctl.h |  64 ++++-
 kernel/sysctl-test.c   | 581 +++++++++++++++++++++++++++++++++++++++++
 kernel/sysctl.c        | 211 ++++++---------
 4 files changed, 739 insertions(+), 152 deletions(-)

-- 
2.25.1

