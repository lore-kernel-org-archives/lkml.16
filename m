Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE751F1313
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735305; cv=none; b=ncD1kMw1tNT+L5B8EHkFfc/tnifK+CJXdMsVk2ie1PYSq/luRVCKp3a29ZGehSzCUq1NbWIm8cQuQwwWPX4dGsSwU9lKdEnniCd43y9zbz4lDhFNC84Mw2kV4Rgo1ysnMO4MLpJ9HXV7kxGE01DQpxPFQnJ+DTimmcEtJwEGjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735305; c=relaxed/simple;
	bh=mx0+sqdmz7ExONA2KrajxLPAnH4pTOp/SJ63TIEKTj0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lSfGTppbCZz77Cycvbvka7+NvFlUhN6Gk/o4sqOhrOasoj8nDfj/+PYPAnF4n+wjZbJUQcj4alv1yrhWc1KrZ/IOUfLmSPUDXQo5WiQt0yOcU4O2Fl3SBmVNDltcSnlT6KbZxEaxYPon3iiTLb1XbYI26Luuac45VrVSonYD+M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ADEs34ox; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ADEs34ox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1749735295; bh=xfu72Ansb0YbK3DXTB/yjp6h12RbUxTUdKMq0wzfGGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ADEs34oxXL5Vb6I/bJLMlcAUwc8viim9zRXJkUXl/3jQYquWNZy9ARBaHA2BFnpJV
	 qHlYMQ4cfmDxpAoYSK57ekJwKgSuLXpBiHUz4dV9p0HJ6EAAvVXzcPTE4SsDdbdEBL
	 ckfkvUOIsZLwBX2GJCxQwirW9tr/zCJ5uky6JV3Q=
Received: from ubuntu.localdomain ([112.48.46.129])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 5A124079; Thu, 12 Jun 2025 21:22:33 +0800
X-QQ-mid: xmsmtpt1749734553ty48fhnjs
Message-ID: <tencent_289DE02620144CF4490D1F9E1EA941243607@qq.com>
X-QQ-XMAILINFO: OAeeP88hDd8wBC7ZFt+SBbUSR5gzK6nO/Lxe1PO/A/F0aI9i7DAoNHmgG1T991
	 KzPtu81egU/OffLtqRpEDlM/eDc8FdUA+XLVqDiisPgHEChQ7DWW5XbfdYpIUejUecZOZZ8q4v4e
	 dt5lu0zAYSWJN+nHBrdX07IWpFVw0pumMYBIAb6FqkEuKg2vNBwV5XidtLM6KuDLShWIOE5nLzNW
	 33uPtLlsamS/PBy3DFV5N8ULmPqE+MqADheaPZtkvezXBOkMgSoXB0RjUmVKHb/ys+z2GF5M4FLu
	 +6ObN8z/TTM9/OheC9p4l+bbXUE3AvTrQB1/S02z8i/SH1T7RqrfTuI5/hJnpnnaJB4yrr6og6y+
	 c1wbrrIWv9LQctMRo5fn+NJvu92mGtBx3wxh0rgSolgCRTKo18rWajItjZRn1UAP5TnxAAB9tb19
	 5u9t3Q7iHX6JtfhFzMFRiBsPPRQt85E4EX9YBa7EGMH6XX/7z1OwYu6doN10F+7RfZfIeB621d/p
	 2EmKSnRQz1BMujFi7cOlGBwhRtuvxNpH8XikYNaalURQ+Hh1XxkRnRWtEHXshesyv+ncLjtH4NVg
	 gR1V2a22xuk5p1DyDXbmLkRcBFu0c+f3yNOgmtwWPsYznH2PJHZpzCOwzs9/q41cBZRDIeJBYmJx
	 bpHc3kwutEE5g+w5ZoHNm4fng4qdcQGnzTYfqlY7TKdsXaaeqeOmpc4Lbbzw7DhHdUz76VdZWHmd
	 RYZB3yjIi0nc7IL+STHIQElOEvxnasmHqGtbTLo1oHqmFQam9UVlYv9LZg7eCiHqpDsq6gqUQ2uJ
	 lVB1W68G4Y/kOgImKAJ5sZWKwqX6V7aGZ7jnAf9GcVEz7y6ufle/VLaS2rLGM4endV7Q5Ditq9ZH
	 5dnHPizDA0mmB4CrCJUPHxY1c9dyXa2U1yFi2qfyXxbziKFqTYlUTDgX9Y5eiDsQvElVuV63skup
	 XA3KJ7z0mX82UOUd0lseQGY0aUZ5KS42PqN46SnpiM62OR4U7gticLdfJT9BY+K36ELsBYlhk=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: 1425075683@qq.com
To: 1425075683@qq.com
Cc: nico@fluxnic.net,
	tglx@linutronix.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] posix-timers: omit posix_cpu_timers_init_group when CONFIG_POSIX_TIMERS is disabled
Date: Thu, 12 Jun 2025 21:22:30 +0800
X-OQ-MSGID: <20250612132230.20351-1-1425075683@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_92F5880EDEB07D078301A561B64F06F9AC0A@qq.com>
References: <tencent_92F5880EDEB07D078301A561B64F06F9AC0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

My apologies—I neglected to CC both of you on my last submission. Please find below the same patch, now with the correct CC list.

---
diff --git a/kernel/fork.c b/kernel/fork.c
index 168681fc4b25a9fddcb90ce155c027551455f4ee..9632e863c17b44424fadc40b2445034ec5cd20d6 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1883,6 +1883,7 @@ void __cleanup_sighand(struct sighand_struct *sighand)
 	}
 }

+#ifdef CONFIG_POSIX_TIMERS
 /*
  * Initialize POSIX timer handling for a thread group.
  */
@@ -1894,6 +1895,9 @@ static void posix_cpu_timers_init_group(struct signal_struct *sig)
 	cpu_limit = READ_ONCE(sig->rlim[RLIMIT_CPU].rlim_cur);
 	posix_cputimers_group_init(pct, cpu_limit);
 }
+#else
+static inline void posix_cpu_timers_init_group(struct signal_struct *sig) { }
+#endif
 
 static int copy_signal(unsigned long clone_flags, struct task_struct *tsk)
 {

---

Thanks for your understanding!
–-
Liya Huang <1425075683@qq.com>

