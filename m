Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382C31BC061
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 18:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738435443; cv=none; b=jkrgGg2shnpysklMqdIwVn07Xjoazm5+jyZxg7UtiUC6citZy3fOtH2TjaoDP7TQkp+6YvMSPuD+NqSGmHpBcXI7WfjWUY6LrqGgntf9YFUyZ+CPNz8YRVPAZeJLFrVHhizSonXprPHyCYMLfa3V0SgZujIDtVmWtwZrueBwc00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738435443; c=relaxed/simple;
	bh=odTsmW/R6oKlNBcF66EaYFpNJAEPzFm0oBmeAn1NxsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jIfl3Y27lohAKyB69UVqbwWuD6jaZReWsimr5qV2or1Je1G/J1c3Mj1sn5XewdMYYowuu1Yq0Ei18XbGXgiLlsScqjm6M1l2m+y8iMpviv7Nik3/VGdsFuruC7DjHZG9SUMa4SryWtB+1Guau0b7tLQHttOmO7nlHMiWnK+Pwkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Grxy9b5/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Grxy9b5/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C88CC4CED3;
	Sat,  1 Feb 2025 18:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738435442;
	bh=odTsmW/R6oKlNBcF66EaYFpNJAEPzFm0oBmeAn1NxsE=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=Grxy9b5/lT+VeujKDnopREgyBEled/7SH5+eJerZ8hdL2j36NgGKZBf3wLeAlOY7+
	 JN5/BbUQhwaHoPIG7DZXHtevgrLFvpHEv+yqdVwDuLBb/UF2kJ+MAHwdHSE8O15a/Q
	 V+SnK3qknC7odKy1opYvQAS9FMNlgIjBIPaUc9cEe1//5Wm98u67KiOwqjTwWaY6Xf
	 jkdSAOajErC9uTvpWdi4wpBeJnhWDMe+G+7ijSoMHW6KqQdCiL5vASii4iZTCbHeVq
	 PHXEdSWOmZh5O9V7tx7lKsOK5vkHMWxQK//sVwo08ISULOwE3KphuUCrzebCp4VVPj
	 DSX/rzutTfBew==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 2B116CE0544; Sat,  1 Feb 2025 10:44:02 -0800 (PST)
Date: Sat, 1 Feb 2025 10:44:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: frederic@kernel.org, vschneid@redhat.com, leitao@debian.org
Subject: [PATCH RFC context_tracking] Make RCU watch ct_kernel_exit_state()
 warning
Message-ID: <19bebbeb-db36-4801-bc3d-2c39989b6152@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The WARN_ON_ONCE() in ct_kernel_exit_state() follows the call to
ct_state_inc(), which means that RCU is not watching this WARN_ON_ONCE().
This can (and does) result in extraneous lockdep warnings when this
WARN_ON_ONCE() triggers.  These extraneous warnings are the opposite
of helpful.

Therefore, invert the WARN_ON_ONCE() condition and move it before the
call to ct_state_inc().  This does mean that the ct_state_inc() return
value can no longer be used in the WARN_ON_ONCE() condition, so discard
this return value and instead use a call to rcu_is_watching_curr_cpu().
This call is executed only in CONFIG_RCU_EQS_DEBUG=y kernels, so there
is no added overhead in production use.

Reported-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Valentin Schneider <vschneid@redhat.com>

diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index 938c48952d26..fb5be6e9b423 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -80,17 +80,16 @@ static __always_inline void rcu_task_trace_heavyweight_exit(void)
  */
 static noinstr void ct_kernel_exit_state(int offset)
 {
-	int seq;
-
 	/*
 	 * CPUs seeing atomic_add_return() must see prior RCU read-side
 	 * critical sections, and we also must force ordering with the
 	 * next idle sojourn.
 	 */
 	rcu_task_trace_heavyweight_enter();  // Before CT state update!
-	seq = ct_state_inc(offset);
-	// RCU is no longer watching.  Better be in extended quiescent state!
-	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && (seq & CT_RCU_WATCHING));
+	// RCU is still watching.  Better not be in extended quiescent state!
+	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !rcu_is_watching_curr_cpu());
+	(void)ct_state_inc(offset);
+	// RCU is no longer watching.
 }
 
 /*
