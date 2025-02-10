Received: from mail.codeweavers.com (mail.codeweavers.com [4.36.192.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AFA264609
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.36.192.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220944; cv=none; b=F45//SLPUELxdIQISn8/Cy7QsAwuYD6/5QHgqTq4ymLhFKasAm3YpwYWcEJ6Juj38Fu55kNv2bF2wIHCK5q0UjBLh1doveMBbQRascHNS0rkWaVuh88bplK57KazEW0PP2+O5pdW4Q6PAP9dismuGtYyIkpLI7jdGbFxqi4ix/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220944; c=relaxed/simple;
	bh=uHf/vmyy7NYkuQS3DHVmxLI9LIwEcT1DGVZtcXwULec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lSKxTZS7371WJsDjGQLWBTEaoFqfrzZXweGij5Wau09vmuJBrmbEyXyRMonweQFUI3aoUYrZIvXMYjzPF/PKX4X/X6wLvB/scSbHuL7IbpAsltt+yZIsVEMz9VP6YRHB4rop9ezYUu8x/es3ZLkUoP2kKIAgDDeuHfyGsOvjPXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeweavers.com; spf=pass smtp.mailfrom=codeweavers.com; dkim=pass (2048-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b=l3jb4In6; arc=none smtp.client-ip=4.36.192.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeweavers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeweavers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeweavers.com header.i=@codeweavers.com header.b="l3jb4In6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codeweavers.com; s=s1; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5lbuFdIRJcMP9duYpPh0kw7F3VwQoNHB0OvF6tDBdrA=; b=l3jb4In6OU1lDgr+mTgJh85GRt
	pMyGqKLc5Bif5ZmQVUS2sLkDhBrzecQ+BG6ySyEzuAiWPqHNrEMRvdWyfNlkYHsjePZx/O0uLfcgG
	OeKjIDE7AYcIkcBSJUTvizyjytQAZ9RwL9JelDsbq4WtM980BzUpZXagEcJYXxgWkTxQua9HqUwse
	yHYFqX1PPvd7o9fJkIw4skmgiMFjasIVOlBBdnOu1YEUMvrDZGg+f2ogcobR4IGV18ttGEyUuatnq
	/i/nTSXSJL1OmFWYC/mooStm3G7BfQuYtUnRhpRLGwL+q4yYDgTaebuaQbztbvfWyJMCNsm237OiX
	DA0mpdwQ==;
Received: from cw137ip160.mn.codeweavers.com ([10.69.137.160] helo=camazotz.localnet)
	by mail.codeweavers.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <zfigura@codeweavers.com>)
	id 1thaZG-00Bf03-17;
	Mon, 10 Feb 2025 14:39:46 -0600
From: Elizabeth Figura <zfigura@codeweavers.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject:
 Re: include/linux/thread_info.h:259:25: error: call to '__bad_copy_to'
 declared with attribute error: copy destination size is too small
Date: Mon, 10 Feb 2025 14:39:46 -0600
Message-ID: <2421077.NG923GbCHz@camazotz>
In-Reply-To: <202502072019.LYoCR9bF-lkp@intel.com>
References: <202502072019.LYoCR9bF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 7 February 2025 06:11:47 CST kernel test robot wrote:
>    In file included from include/linux/spinlock.h:60,
>                     from include/linux/wait.h:9,
>                     from include/linux/wait_bit.h:8,
>                     from include/linux/fs.h:6,
>                     from drivers/misc/ntsync.c:11:
>    In function 'check_copy_size',
>        inlined from 'copy_from_user' at include/linux/uaccess.h:207:7,
>        inlined from 'setup_wait' at drivers/misc/ntsync.c:888:6:
> >> include/linux/thread_info.h:259:25: error: call to '__bad_copy_to' declared with attribute error: copy destination size is too small
>      259 |                         __bad_copy_to();
>          |                         ^~~~~~~~~~~~~~~

This was caught before and mentioned in [1]. The suggestion there of changing "args->count" to "count" doesn't help.

Somehow gcc 12 thinks that the array_size(count, sizeof(*fds)) parameter is constant, although it's finnicky and depends on exactly where __builtin_constant_p() is evaluated.

The bug goes away with gcc 13. Is this worth trying to work around? I don't have any ideas for how to do so.

[1] https://lore.kernel.org/all/21811752-06d3-44cd-b3e6-f8124676df87@app.fastmail.com/


