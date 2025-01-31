Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0870154420
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738357024; cv=none; b=rTuZEXxYJcQ+MbNOpcWWF8XdOpUFemfsCGQWmJXZGYoRldAfRIB9DETT+xYDqRWhjepmCGLp0WN+gom0SPNO+wGzbPxyECylLKCLzI8sP7oWwuSwijf2vZmTP/+zZ4jcnKcnilVmliDPSnXOv5f6lktgXRg5IRVA+JMYFSQ2WVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738357024; c=relaxed/simple;
	bh=ol7qWmvvw+eFfWf/HRNJV2age131+Fg+f+Yy4JjP3Y4=;
	h=From:To:Cc:References:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:Subject; b=LW7Ld0MrYz/oZvSYr6JK8tfIfvp5HIkps7h+xQ/1bpCaDK6OwV7V1n6ki7nIxi/q9gSw/KtTN3Ipp7e1u+epezUkMDtNn6rNa7zNzZDWd/44G0kvLpAGqVY82cJpE+SVohpLS+ujtNJ7olXPEKAozhgEpgjbEd8yB2HSZPvSOvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in01.mta.xmission.com ([166.70.13.51]:59982)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1tdy4O-00ArVh-15; Fri, 31 Jan 2025 13:56:56 -0700
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:50098 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1tdy4N-008RBu-2v; Fri, 31 Jan 2025 13:56:55 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: brauner@kernel.org,  oleg@redhat.com,  akpm@linux-foundation.org,
  linux-mm@kvack.org,  linux-kernel@vger.kernel.org
References: <20250128160743.3142544-1-mjguzik@gmail.com>
Date: Fri, 31 Jan 2025 14:55:47 -0600
In-Reply-To: <20250128160743.3142544-1-mjguzik@gmail.com> (Mateusz Guzik's
	message of "Tue, 28 Jan 2025 17:07:43 +0100")
Message-ID: <87ikpubt4c.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1tdy4N-008RBu-2v;;;mid=<87ikpubt4c.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX18aFeIbJvVu5HGQ5jxISWzXSREXGfFDYmE=
X-Spam-Level: *
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4998]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.2 XM_B_SpammyWords One or more commonly used spammy words
	*  1.0 XM_B_Phish_Phrases Commonly used Phishing Phrases
	* -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Mateusz Guzik <mjguzik@gmail.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 387 ms - load_scoreonly_sql: 0.03 (0.0%),
	signal_user_changed: 10 (2.6%), b_tie_ro: 9 (2.3%), parse: 0.76 (0.2%),
	 extract_message_metadata: 2.6 (0.7%), get_uri_detail_list: 0.86
	(0.2%), tests_pri_-2000: 3.0 (0.8%), tests_pri_-1000: 2.3 (0.6%),
	tests_pri_-950: 1.18 (0.3%), tests_pri_-900: 0.97 (0.2%),
	tests_pri_-90: 166 (43.0%), check_bayes: 165 (42.6%), b_tokenize: 4.9
	(1.3%), b_tok_get_all: 56 (14.4%), b_comp_prob: 1.97 (0.5%),
	b_tok_touch_all: 99 (25.5%), b_finish: 0.84 (0.2%), tests_pri_0: 183
	(47.2%), check_dkim_signature: 0.46 (0.1%), check_dkim_adsp: 2.9
	(0.7%), poll_dns_idle: 1.08 (0.3%), tests_pri_10: 2.1 (0.5%),
	tests_pri_500: 7 (1.8%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2] exit: perform randomness and pid work without
 tasklist_lock
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org, oleg@redhat.com, brauner@kernel.org, mjguzik@gmail.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out01.mta.xmission.com); SAEximRunCond expanded to false


Oleg asked that I take a look, and I took one.

I very much agree with Oleg that this should be one patch per thing
you want to effect as the issues can be intricate in this part of
the code.

Moving proc_flush_pid inside of tasklist_lock is a bad idea.  The code
has previously been several kinds of a sore spot.  If you look at
proc_invalidate_siblings_dcache you can see calls to d_invalidate,
deactivate_super, and a few other vfs calls that could potentially do
quite a lot of work and potentially take a number of locks.  It has been
a long time but I remember when we used to flush the proc entries under
the tasklist_lock that there were actual deadlocks caused by some rare
code paths that were trying to free memory to allocate memory to make
progress.

It is wrong that attach_pid/detach_pid can be performed without the
tasklist_lock.  There are reasonable guarantees provided by the posix
standard that the set of processes sent a signal is the set of
processes at a point in time.  The tasklist_lock is how we provide
those guarantees currently.

There are two more layers to pids.  The pid number allocation of
alloc_pid/free_pid, and the struct pid layer maintained by get_pid,
put_pid.  Those two layers don't need the tasklist_lock.


It is safe to move free_pid out of tasklist_lock.  I am not certain
how sane it is.

Eric
