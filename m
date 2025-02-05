Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E072C151986
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 11:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738754234; cv=none; b=uJKZYL2wPi95qbWGzLdMgfCs9qUwMAxwdsmAutSSEy7CxSvphCS09AMXZMMXyNgpiOi59i0GTAB7rhUoVpckPtg493JmEgXJSfSeiIlknOU1Z1vMsK7a+rq3+1b8ec7j8CcfDefBZMaJEL7H1896ZIyPfnWjlr8mt9RXzk2Lz+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738754234; c=relaxed/simple;
	bh=kp2g7LGlHTMRARhEZFmSC+I+oxCFGNezCD9pPQIsgpQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FLNyIRk5vTB7RPR83EEb9uLivXBb34tQvPtvZhcsGYTeB/I9m4PN5zHA5c8OPMrfU77IEdWOtIgURa2+slpqiTgQt3CCaintNEswz+WjuOd0qH3iSYU6BWyWsHg09arquttjPVzLbLXRfKCOBl6pUEsfZNYWRCWJwmH3UOn94yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KmXVmJyG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KmXVmJyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738754230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cD+qOkK4P9U6FFw6bLyK7nIvoyXLS9FE41ncTToccdk=;
	b=KmXVmJyGcr03VOJwzZaZApPO8QWZ+clb8SHhuu+JdwI2F30o1SHTO+S2TqALmK3USsb0Ng
	ErCVpTF500v5wtZb8csRsfmlH205Kwq7u50wX2UZXweK/1m1Mwnyur1ywiVZ/dhE4jNtoA
	6dTOSfOjykdyKZZSUXPxeXkNKM5Q580=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-iG8uZIV8PFa-WcD6SQAZKg-1; Wed, 05 Feb 2025 06:17:09 -0500
X-MC-Unique: iG8uZIV8PFa-WcD6SQAZKg-1
X-Mimecast-MFC-AGG-ID: iG8uZIV8PFa-WcD6SQAZKg
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43626224274so34994165e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 03:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738754228; x=1739359028;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cD+qOkK4P9U6FFw6bLyK7nIvoyXLS9FE41ncTToccdk=;
        b=M+cL5hTFh+YQnOHj6Ezpk7kTmoPTkQ3Ihmjaz5Rl9bnlwDGaBWpX2jgcFD7HW7cIXb
         cRpwGB0/FGt1P/mlSJMIY7p/69AnyQtjWlJ4yCQdzo8AAaB8a9nAFqJVj4CXrYmKT6qD
         4ecuYlGLLAfAiGAJPHqVpvkbCkTCsE0ZotRZ8tspls/NbJDNhh9K+mgR3XynoEb+7lON
         3QQyr5Y7GREv5dOhmKmenXGjm573A+TjUR2tsCZCaNO5tBcI1mTyTozU39/e/JU/1Clr
         TKqM9gMKwFFv/DCmIfYYREKjyi5/1FbP8SFjiM0r5zcgp7SRjt2u5E32KrMpXUIpSPR1
         PcLw==
X-Forwarded-Encrypted: i=1; AJvYcCUSXR68fRn4bDKMf3oglANJxxu6xLC5U1PSiMkxBNXgj7RjYHiYNUrNTS5ls01EPP0+nQge7tZBUVY5WU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxESs4SdkqAC00wFu+j01pNArEcFZ5W2hZ/hgOfFyWGkxwz0W76
	pngN/oxQGGDjPB4pFiWUzP4dyWtdJXbIVYbxJyyRD1NKNGB/9fXwg/wrrXi5DG6Y15kl2gIkz20
	IXIy53pUH/E99tCA/lo0JcIjmeTqQlYKKEREq+VN/7MIVCYUavIIzif7ZDq0Quw==
X-Gm-Gg: ASbGncvm/bMCkCEiPeIor89AC2eg5yCAHmidcp8kShQR6nF87becyywhXDgOLNooXVe
	utaTq4WBkuTydOr+bwZKjq5Myju6+E1UEeCfQ3NjOR7ukPA0TqoPEhmHXsRGuK61vpmz5gTzPJy
	UJTKFxPdaFVqtsL6tXImJJopdc5y5sk0ebzx96wwTJpP6DX3A17LURXFWVADU72hiszGbRevGpO
	7hmfyzXq7U3KfrCwf8XjT6hDcJ1jZMXbMd/HBWdnd3BQAuny70mzy0w3ieMTl/D93rsv7hzKkPj
	ewqum2TYxFMUjlgOxIkQyhT2byL+ea7xvPcCxuTsEKtWX8QwsjQEcDm+XrDQ/phT0g==
X-Received: by 2002:a5d:5985:0:b0:385:e0d6:fb73 with SMTP id ffacd0b85a97d-38db48bb11bmr1704792f8f.15.1738754228229;
        Wed, 05 Feb 2025 03:17:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeSip/bQcqxkZ3DpzKmFv8OXeTgMvHL67CjmR5y3ft2RFq4VYQJf/d6zas7TSf20o+8xw1Og==
X-Received: by 2002:a5d:5985:0:b0:385:e0d6:fb73 with SMTP id ffacd0b85a97d-38db48bb11bmr1704768f8f.15.1738754227846;
        Wed, 05 Feb 2025 03:17:07 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102ee0sm18754069f8f.37.2025.02.05.03.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 03:17:07 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: paulmck@kernel.org, linux-kernel@vger.kernel.org
Cc: frederic@kernel.org, leitao@debian.org
Subject: Re: [PATCH RFC context_tracking] Make RCU watch
 ct_kernel_exit_state() warning
In-Reply-To: <19bebbeb-db36-4801-bc3d-2c39989b6152@paulmck-laptop>
References: <19bebbeb-db36-4801-bc3d-2c39989b6152@paulmck-laptop>
Date: Wed, 05 Feb 2025 12:17:06 +0100
Message-ID: <xhsmhjza4k5e5.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 01/02/25 10:44, Paul E. McKenney wrote:
> The WARN_ON_ONCE() in ct_kernel_exit_state() follows the call to
> ct_state_inc(), which means that RCU is not watching this WARN_ON_ONCE().
> This can (and does) result in extraneous lockdep warnings when this
> WARN_ON_ONCE() triggers.  These extraneous warnings are the opposite
> of helpful.
>
> Therefore, invert the WARN_ON_ONCE() condition and move it before the
> call to ct_state_inc().  This does mean that the ct_state_inc() return
> value can no longer be used in the WARN_ON_ONCE() condition, so discard
> this return value and instead use a call to rcu_is_watching_curr_cpu().
> This call is executed only in CONFIG_RCU_EQS_DEBUG=y kernels, so there
> is no added overhead in production use.
>
> Reported-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: Valentin Schneider <vschneid@redhat.com>
>
> diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
> index 938c48952d26..fb5be6e9b423 100644
> --- a/kernel/context_tracking.c
> +++ b/kernel/context_tracking.c
> @@ -80,17 +80,16 @@ static __always_inline void rcu_task_trace_heavyweight_exit(void)
>   */
>  static noinstr void ct_kernel_exit_state(int offset)
>  {
> -	int seq;
> -
>       /*
>        * CPUs seeing atomic_add_return() must see prior RCU read-side
>        * critical sections, and we also must force ordering with the
>        * next idle sojourn.
>        */
>       rcu_task_trace_heavyweight_enter();  // Before CT state update!
> -	seq = ct_state_inc(offset);
> -	// RCU is no longer watching.  Better be in extended quiescent state!
> -	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && (seq & CT_RCU_WATCHING));
> +	// RCU is still watching.  Better not be in extended quiescent state!
> +	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !rcu_is_watching_curr_cpu());

Isn't this equivalent to the check done in ct_kernel_enter_state()? That
is, it operates on the same context_tracking.state value that the
ct_kernel_enter_state() WARN_ON_ONCE() sees, so if the warning is to fire
it will fire there first.

I don't have any better idea than something like the ugly:

	if (IS_ENABLED(CONFIG_RCU_EQS_DEBUG)) {
		unsigned int new_state, state = atomic_read(&ct->state);
		bool ret;

		do {
			new_state = state + offset;
			// RCU will no longer be watching. Better be in extended quiescent state!
			WARN_ON_ONCE(new_state & CT_RCU_WATCHING);

			ret = atomic_try_cmpxchg(&ct->state, &state, new_state);
		} while (!ret);
	} else {
		(void)ct_state_inc(offset);
	}

> +	(void)ct_state_inc(offset);
> +	// RCU is no longer watching.
>  }
>
>  /*

