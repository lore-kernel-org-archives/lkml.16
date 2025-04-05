Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9C82E62C8;
	Sat,  5 Apr 2025 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743841522; cv=none; b=P739hMviz9sbHXJSoktsngH0n1+bqQLm7m8DjHFOfJMo0q91Rg4yi9sZzaL0G3OiXo0rohSCvbMW6mc082QEpC+yqW2WSd/+bQJpAJEpncgSrEUN96nJrPfJ+ei6HMkN5nBSbLyQLBCo0sU7OzmSewqzCV19yKfsdv9V2pBWw/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743841522; c=relaxed/simple;
	bh=llE8Rzcu/JNRYYmp/9fQoWdonSDcPERxw5YGqXSnrCA=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=T8rLNsughvXyAZbuidVWBXOt0M9P1f+jKwK8kDvbsM46wHyenCHxdWD69yA0i40ii8gSy6B44WkIGM4qJAocPOr414jGoTmYBECT1I3Z1a7W8F2f5CvADCivJxvyodJYhIGkQIKBsJDi9hOVVSQd8788iRx54q7i3X28skjR1zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=FKkfryat; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="FKkfryat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743841514; bh=XXg2Rrz+TN74fpd+BVyAawjZrLAgf69cmfUiXVsCo0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FKkfryat5xbMfgnpHywgKiYBb8RoKM/zsbxicZNnjH9eFLPeuHZ8qEQlTZCb5YmKN
	 jP7p3dLTVjskIuXLU2zISdR98CaLFMbpipss+wI/H6MDG0j1PrRjj/b0UWnKl7Q2tH
	 va60oOLJmvW8htLujVNiFYyNPTGisF20Ossgthcg=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020.. ([240e:3b1:d00c:11e1:5b19:9fa9:c22e:e549])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 64C22ED4; Sat, 05 Apr 2025 16:25:12 +0800
X-QQ-mid: xmsmtpt1743841512tjc3ou65o
Message-ID: <tencent_6257D365DB7BACED49A32ED535ACE884CD09@qq.com>
X-QQ-XMAILINFO: OaoBA5NOFC/jnAXZRXgve8m8GcT78yw/anjQJogBeqZYEwxtj7m7VEV06m4roA
	 CrIJLroWrCFw6O2HK0VAf4V/l738OKnfLh/hMh/Hsys4NlwNj3AyJjN8IBoEu37jgZ7enrhn3Uc2
	 MOfXnSyZX2QBvllppqEkbotXhVgQ+Pu13q/1JPmEmhmLJYbeGEzouUmGoF78Yik9voBi0OYYtoLP
	 OqaiZWNUjGt/LGU36jWYCv2/ydAz2WkSTVE/el4PvSOvPzNOOR7mjIkGaeKjlM0ytxCa5q9s6aI5
	 2+2cWeIJ0ALSg73huRvcm1q26GHgFxxt+Y3FQmKG108gpyWz1RXXc1DwHY1ePJA/D7LWNyy4mZIY
	 acOuXoATjwEOrvNx2zEo9AjTY3yCYH+XY0qxbM8J7un5EOeSP7bcd5LARcvcqP1plFw1tnREuSR6
	 Pg7Z88pKxzT8aEY9ysoEnC8sNyUDWB/ZcQLf0mPpOknDyg2whXyGbhdGwr9gzi8/g5TYnhaio5/T
	 7kkXmRbsBTlCvx1U04MumHXco6/qZq3706l2jqc9uYfvno8LHcIKZ5DZn+1xhaTbdLhnQQ3m8uwD
	 t5iwo8ar7SFuOW5HqE9y2k1dKQgo2ToBLV7nIBZnT4iC7p1vfkCncvxlK+Sc+MgCLwZ+ZnuEmgVn
	 wi3BhfA3frPGkg2msmb2hJBosiA9DmDT5PNvaB8IWVmNl8Nm1UyLreXeJmbL4biXNdtNkOXQwfTk
	 FNHrAnqTCwjSbGsApaCD849ioAbLuBnyo6KLxySAQzdZWhizz8rvZoTD6SOlQMeCyAmYv1v3Ifz9
	 4VBLEUcJzfRmTu28kCSenWIYoBvdUlGQL1gJJSut8yBih2bHtUps4A6Mms3CCwfAODEo9ffFE39g
	 WdpGjyzAuueCVBDSi94PS+9QSRB7gAxvzIB3eDOFBR3TPZrnPB3ptTdU/KvAfHTqC52rUbkTuQJe
	 z37ny4TlNjdl//VHeN4WYaQD4uvX0q9FjR4g2gccPEfU8rpUwTkQ==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Guangbo Cui <2407018371@qq.com>
To: lyude@redhat.com
Cc: boqun.feng@gmail.com,
	linux-kernel@vger.kernel.org,
	longman@redhat.com,
	mingo@redhat.com,
	peterz@infradead.org,
	rust-for-linux@vger.kernel.org,
	tglx@linutronix.de,
	will@kernel.org,
	2407018371@qq.com
Subject: Re: [PATCH v9 9/9] locking: Switch to _irq_{disable,enable}() variants in cleanup guards
Date: Sat,  5 Apr 2025 16:25:11 +0800
X-OQ-MSGID: <20250405082511.1683981-1-2407018371@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227221924.265259-10-lyude@redhat.com>
References: <20250227221924.265259-10-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>  include/linux/spinlock.h | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
> index 897114d60cfd4..764c9fd797d0e 100644
> --- a/include/linux/spinlock.h
> +++ b/include/linux/spinlock.h
> @@ -605,18 +605,17 @@ DEFINE_LOCK_GUARD_1(raw_spinlock_nested, raw_spinlock_t,
>  		      raw_spin_unlock(_T->lock))
>  
>  DEFINE_LOCK_GUARD_1(raw_spinlock_irq, raw_spinlock_t,
> -		      raw_spin_lock_irq(_T->lock),
> -		      raw_spin_unlock_irq(_T->lock))
> +		      raw_spin_lock_irq_disable(_T->lock),
> +		      raw_spin_unlock_irq_enable(_T->lock))
>  
> -DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq(_T->lock))
> +DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq_disable(_T->lock))
>  
>  DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
> -		      raw_spin_lock_irqsave(_T->lock, _T->flags),
> -		      raw_spin_unlock_irqrestore(_T->lock, _T->flags),
> -		      unsigned long flags)
> +		      raw_spin_lock_irq_disable(_T->lock),
> +		      raw_spin_unlock_irq_enable(_T->lock))
>  
>  DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irqsave, _try,
> -			   raw_spin_trylock_irqsave(_T->lock, _T->flags))
> +			   raw_spin_trylock_irq_disable(_T->lock))

It seems that the `raw_spin_trylock_irq_disable` function is missing from
spinlock_rt.h, which will lead to a build failure when compiling with 
PREEMPT_RT enabled.

Best regards,
Guangbo Cui

