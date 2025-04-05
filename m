Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6B520311;
	Sat,  5 Apr 2025 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743843317; cv=none; b=qUwpUiia2XhMORrU63OJ31b1MrIzplv/cgR++la9oi2ARlRBelgKHJEZxRoZTvg1mch7hFP45BfqoszKZvWua4jDRtv4Xn5XmfM4mzmEB9V9oMU9W9zHUDVcYmf1PgyebrrEo3Gap2EkwsPVz2/cEuyKKg3wss16CxWM6LhB1a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743843317; c=relaxed/simple;
	bh=uv0p0W6pWbspI+DJwg+eOmvUIJ14Tof4Wz8rLztAykM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKBjEPOzEEes+YNmtq00EfwadIrgLGPaXWesMORmnXUM4YVkVLWkXOGF2UFbW99K0yTHexDCF6AroqnFKBNObkjolGbAk6eq21QFH2CHOeJLstz6OoXjnBTwEQizTcUpalxr9wMYAHfqS31WZzwIITMqFFn7NVoE2Q4a+zHhuFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mk5Mkj07; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mk5Mkj07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743843309; bh=5dIrIhhEHxNiKWxpMtv5ugS241ycnXpJhs0nYeJreGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mk5Mkj079wM+c8G7Y+6FhaNY4xIlm5yffk+Rajdx1ZxeZlNQ6nEhnnHVPM4QtWoNN
	 SVaKX6r82T15ExWgd7tWe4iTw2VtWLFaaigG+i6bfeNiSq5a9M+yVHNimASQ2dzJ8v
	 LtABXZngFGufwXyLL9mQn7lvipZYAFwDTrUX4/8o=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020 ([240e:3b1:d00c:11e1:5b19:9fa9:c22e:e549])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id DC6AF460; Sat, 05 Apr 2025 16:55:06 +0800
X-QQ-mid: xmsmtpt1743843306t27orav2n
Message-ID: <tencent_D533AC8B48B52FF3359EE89ACC69D32FDA09@qq.com>
X-QQ-XMAILINFO: MGSlRwRrdVfIQmSsconBxsBLSDC7XujWe8X76N0Ut8/oD43VQHF5ImlEtXum5O
	 Jp+5/Abp/yItBFjlTrN/wEbqOx67Y9iyBMZhmWcwpGRcItKDwLk3ovPs0palr+Fap4c1ppwcqSSg
	 24f2O5zPydF/6uetpndF+/XkP/Desfyeof2/2SjohHc4PuJoyVJbDH9V75lXZ8/xnuCyTL/6fQ+F
	 LgarAJGtjMdwKQ95weohEZF+nB4moVg4la8WbTyGb737ifhG1Sa0Vqqyw4IWvgp1eyeyr3sm9YJw
	 ocTNs8dZjuWn61bckE6teBwGTo5lcehwoGdVK5XkDVx2g2Yhq+8QZz3E6UbQ4sD5MVUWRYzWk6rN
	 zjrCRfUWl1g9qLq8sOqmEmLaeyLnj0LgFymtpwr0/aBgpMr1OsIonjhA2A1pUHpa5Q7N57lr+oE0
	 YIKWUwWZDslfhfMV/76/QQP/JoQr4URYZhNJLbiGHQM+g5TfFARm1aBQ302qcSZsFrweorpO4v61
	 z2kSfi3iexqGpi55aOP5fVWkIpXOrxNiSou4G6BL2/xl1fOF/6UuBq8M/wc/ozNLToAEHf9P5kSW
	 6/dauDmP86FD4a+8rLkXb0ChW/BehIKsXKlswiaB6/oFr1yhxGBRpPm/8ljKck9rCJfPcOIcK4Gq
	 DIL4Rp1+kXdibgTnU0BZDWe2p4G3FlTRGCeBPyqas9TlwJM/dDFH/UuSPKNBJ8MemhNFIxij/gF/
	 1Dap/vse8YsI+xovriAEmQ1IrrFs0xItvcAO02hnCniuU0/TVaz8SkWKl3cSXfBiERlCAoV1y1w4
	 eENdhZDIjcdCRby//wLEsCr7i7ZxYcPuPflC8TSrO6nxx8l+NV54FU43VNpHmw2g4QWnWbekUakC
	 hHJR0L4VpLrdgj12Cv2EMUNol1JfXGF1ZJVRLW1V/wr743y2HgDIURGbwoyXRHmdpss1RuzJyCie
	 hg8hkJX0cfTgcab1utYJCJfB0Br7u3bmaWY3Ef++4o+4QhrUyliot0w/AG4b4JFzzNweMsJdX1nn
	 nbklzQB18OPkwgGJjp
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
Date: Sat, 5 Apr 2025 16:55:06 +0800
From: Guangbo Cui <2407018371@qq.com>
To: lyude@redhat.com
Cc: boqun.feng@gmail.com, linux-kernel@vger.kernel.org, longman@redhat.com,
	mingo@redhat.com, peterz@infradead.org,
	rust-for-linux@vger.kernel.org, tglx@linutronix.de, will@kernel.org
Subject: Re: [PATCH v9 9/9] locking: Switch to _irq_{disable,enable}()
 variants in cleanup guards
X-OQ-MSGID: <Z/Dv6ot2V7u+Ig19@jckeep-Lenovo-XiaoXinAir-14IIL-2020>
References: <20250227221924.265259-10-lyude@redhat.com>
 <tencent_6257D365DB7BACED49A32ED535ACE884CD09@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_6257D365DB7BACED49A32ED535ACE884CD09@qq.com>

On Sat, Apr 05, 2025 at 04:25:11PM +0800, Guangbo Cui wrote:
> >  include/linux/spinlock.h | 26 ++++++++++++--------------
> >  1 file changed, 12 insertions(+), 14 deletions(-)
> > 
> > diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
> > index 897114d60cfd4..764c9fd797d0e 100644
> > --- a/include/linux/spinlock.h
> > +++ b/include/linux/spinlock.h
> > @@ -605,18 +605,17 @@ DEFINE_LOCK_GUARD_1(raw_spinlock_nested, raw_spinlock_t,
> >  		      raw_spin_unlock(_T->lock))
> >  
> >  DEFINE_LOCK_GUARD_1(raw_spinlock_irq, raw_spinlock_t,
> > -		      raw_spin_lock_irq(_T->lock),
> > -		      raw_spin_unlock_irq(_T->lock))
> > +		      raw_spin_lock_irq_disable(_T->lock),
> > +		      raw_spin_unlock_irq_enable(_T->lock))
> >  
> > -DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq(_T->lock))
> > +DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq_disable(_T->lock))
> >  
> >  DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
> > -		      raw_spin_lock_irqsave(_T->lock, _T->flags),
> > -		      raw_spin_unlock_irqrestore(_T->lock, _T->flags),
> > -		      unsigned long flags)
> > +		      raw_spin_lock_irq_disable(_T->lock),
> > +		      raw_spin_unlock_irq_enable(_T->lock))
> >  
> >  DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irqsave, _try,
> > -			   raw_spin_trylock_irqsave(_T->lock, _T->flags))
> > +			   raw_spin_trylock_irq_disable(_T->lock))
> 
> It seems that the `raw_spin_trylock_irq_disable` function is missing from
> spinlock_rt.h, which will lead to a build failure when compiling with 
> PREEMPT_RT enabled.
>

Sorry, my fault, I mean the `spin_trylock_irq_disable` function.

> DEFINE_LOCK_GUARD_1_COND(spinlock_irq, _try,
> 			   spin_trylock_irq_disable(_T->lock))
> 
> DEFINE_LOCK_GUARD_1_COND(spinlock_irqsave, _try,
>			   spin_trylock_irq_disable(_T->lock))

Not sure if I wrote it correctly, but you know what I mean.

diff --git a/include/linux/spinlock_rt.h b/include/linux/spinlock_rt.h
index 6ea08fafa6d7..4a65da35b211 100644
--- a/include/linux/spinlock_rt.h
+++ b/include/linux/spinlock_rt.h
@@ -151,6 +151,11 @@ static __always_inline void spin_unlock_irqrestore(spinlock_t *lock,
 	__locked;					\
 })
 
+static __always_inline int spin_trylock_irq_disable(spinlock_t *lock)
+{
+	return rt_spin_trylock(lock);
+}
+
 #define spin_is_contended(lock)		(((void)(lock), 0))
 
 static inline int spin_is_locked(spinlock_t *lock)
-- 

Best regards,
Guangbo Cui

