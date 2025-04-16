Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792CE1A0BD6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815775; cv=none; b=Ijg/Suzmb9TP8Lz17Yds+4Uve8E7lJUJ42BvTk6w4Io7bHGj4UYbWjrUr63kOhtE3HMglNz9x0bey/YDLEYnOWvzB1NH1K3Er5WLrFtRbdfjzvBlbIHmUyB4Bxc9DjC4vJTqj41ch2s4X/DrtX/AwCBWvD/Ndf5iIoDaA84CQwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815775; c=relaxed/simple;
	bh=IQQMr++ejsZw0KfhanTU/+IFMKcwynCPQ7jx1iWxd2E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bAd33mQ0l4ZUXVXXI7R9+QDntYjKkzpZrtoqbPs9nn+ZWZC5yjHl5RTywO1Hg1krLQAeUTgzb2dgLiqkT/8DqpBQTPOB7t7W8STulAEtCSwi08S+q+yA1ST1t2DWB9Ky56E8OjlulfGBorQFx5u+1TokyrBHy6SD4YnWkIqniX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4AEC4CEE2;
	Wed, 16 Apr 2025 15:02:54 +0000 (UTC)
Date: Wed, 16 Apr 2025 11:02:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [mainline]Kernel crash while running ftrace selftest
Message-ID: <20250416110253.62056f4f@batman.local.home>
In-Reply-To: <1db64a42-626d-4b3a-be08-c65e47333ce2@linux.ibm.com>
References: <1db64a42-626d-4b3a-be08-c65e47333ce2@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Apr 2025 12:37:15 +0530
Venkat Rao Bagalkote <venkat88@linux.ibm.com> wrote:


Thanks for the bug report!

> [15137.589546] NIP [c0000000003e4738] ops_equal+0x8/0x170
> [15137.589553] LR [c0000000003ec708] ftrace_update_ops+0x78/0xe0

Hmm, I'm guessing that you hit a path where the filter_hash or
notrace_hash never was initialized.

> [15137.589561] Call Trace:
> [15137.589564] [c00000001473f9c0] [c0000000003ec6ec] 
> ftrace_update_ops+0x5c/0xe0 (unreliable)
> [15137.589575] [c00000001473fa00] [c0000000003f31b4] 
> ftrace_startup_subops+0x124/0x5c0
> [15137.589583] [c00000001473faa0] [c

Can you see if this fixes the issue for you?

Thanks!

-- Steve

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index a8a02868b435..777574fa3095 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3625,8 +3625,8 @@ static int rebuild_hashes(struct ftrace_hash **filter_hash, struct ftrace_hash *
  */
 int ftrace_shutdown_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int command)
 {
-	struct ftrace_hash *filter_hash;
-	struct ftrace_hash *notrace_hash;
+	struct ftrace_hash *filter_hash = EMPTY_HASH;
+	struct ftrace_hash *notrace_hash = EMPTY_HASH;
 	int ret;
 
 	if (unlikely(ftrace_disabled))
