Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3638128399
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 06:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738735249; cv=none; b=INdQgID+Lg35TcZYjeyiAUJILKg9XjA10HEUNbpcria/A0yGSTMJjHNwqhSl1DFQVyp8+LG4mEnrUn9XQwG3JYmkjkWiKXvUiz5FvB864fnH2AmzJU/aydKf3lYqy6leDrHQwV07kW9xKlKj/b8m6zJBGkntihDz8PdsAI2WkGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738735249; c=relaxed/simple;
	bh=NBRaSD7EqLnT+cNWbYhjzag1hsHn4NX+OyaSkwAKLlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwVqs4/si3+ryp/NAGTALeTzbptItcSaWXof/s05mDAm9/lgyEXjx7N/UEcrNwigvYgajctBxJ07mYPDAXZU5vf+/doBVuPLc4SIznxx7DeDOs1sH91aQUX021ocQp3eoZ2jLIMZxi+E1Wl9r2VSmY23oJx40PLcV9QSJaungIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMrk39qf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMrk39qf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso47001155e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 22:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738735245; x=1739340045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hNlXudGlTk+y6I7fRQAl7i28jnOA/Bs2ncG+/V/GbQU=;
        b=aMrk39qfW7bkq9QIN/a+4kSG7v2lp9kfoPHfLOmv+G9/GKP836X6Z++ImY7ZqyGREg
         zCSuRnE/Rz6YedtvDQudzdZ16V5/PBfa/sY7GBCpd8azudFQSaZpxQYNAHs9Syjf+mrY
         NFD32XE14QHthHyB9MxWP6rx4S2Hf8hdlU9iWM6gTjzDERZW6M1V2CUI+Yg0M3fyz8Oi
         6YcX7m5s8icJhPktX1d5Mpo6A/gZx9hbB33fxX5c1GCzho4bixWXJAH8zKk3XiG3oKYE
         DjYyEhv64KLumkAz92siaYkYfWvwCiuAA59IPzzrGuqQUKGO5SwMYAV6/6O50Kc4aaa3
         4vHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738735245; x=1739340045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNlXudGlTk+y6I7fRQAl7i28jnOA/Bs2ncG+/V/GbQU=;
        b=EaQRyxTZhQZVsaY301k6FEz0WnmSWBV5s8iQe2FwUnEyL6CI8SyUqZUqANIbxJ2+nw
         6OpcvVWkMOcWhuzKCPzx5MjAbtsHA76IY+H6pQIydaOFER0MK7ldl0ydbj1B+zVh7Yl9
         1tE7/Vds/pILxgdTnHObQUUjC8xP5fbytufNXJXsdRqbOa02TTwZWPN9dWRijFlCsVbQ
         TncNndh4A3f+ihS1KKMzWZ4FbRCIMpBg8yP/IA+U6obi7cZdumAE0+CfPwiJLryeOoZm
         YdhAUg5a/HSluH1sN7rQ+d13R+yVwttUBNoAypQAfwBWCn4JyZ7UunDXMG3N7kUB9a1t
         b5dg==
X-Forwarded-Encrypted: i=1; AJvYcCWmbStXrtwQ7NZKOsGuZu0VkdSaONqegwxb9/tdlAAAkWKrUl5wZucXsjkLNdivZxsvH/IFFMKutBxviok=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz0YIHZPEmYG5dc8vt8NT4KUKvFez3tnASguXNV61gDBWYbhAp
	u08KP+Foue3zFuLDF5hbxIcYbbcafr60HaJwx5vA8HM04LkvaEkYDYgIamHEYSY=
X-Gm-Gg: ASbGncs/NoCeTxgwHaJEMVDaGgLtd8bgRBQFVw/mqMLVOIsiBPBOdIXZLvTldnOwua2
	RWiDDMfEm9GAuY+1yKMOEmbZfV/LrFWYmVO5VkVeQoH2HcEyIXeOg5VucxUa/9B4Ugf5PEAsjD+
	hFXucsADZw+8qQ/8uqqTxqwcjAvhFzG3UPVHHkXQXl7BdaKj5slrOC/hLG9KA70E6y2yy9oxGjs
	DqlSbmcQZS9G8cV6wHmhkceU6Zu/GoA3FxI0aq7OCanmAq/2n6KRT/B5TEnCxVdX5btPuFiIlFy
	WgqCDzCgu/OZunPMKNh4
X-Google-Smtp-Source: AGHT+IHnXn/0+sVZN5phuuTMWLExRHIl5mlDiKCt9L49AJLiWu+ymeOzo7LpZameVlX8MAniU5iOkQ==
X-Received: by 2002:a5d:64cb:0:b0:38a:8d4c:aad3 with SMTP id ffacd0b85a97d-38db48bdac0mr791322f8f.18.1738735245493;
        Tue, 04 Feb 2025 22:00:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38db5b3ce3bsm656007f8f.44.2025.02.04.22.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 22:00:44 -0800 (PST)
Date: Wed, 5 Feb 2025 09:00:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ian To <onlyian4981@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <e831420d-77cb-4ff1-9c13-1779981988f2@stanley.mountain>
References: <cover.1738720049.git.onlyian4981@gmail.com>
 <d0b70310eb6b2dfdf062ba865362cd2640cb93e0.1738720049.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0b70310eb6b2dfdf062ba865362cd2640cb93e0.1738720049.git.onlyian4981@gmail.com>

On Tue, Feb 04, 2025 at 05:50:16PM -0800, Ian To wrote:
>  /*
> -Caller must hold pmlmepriv->lock first.
> -*/
> + *Caller must hold pmlmepriv->lock first.
> + */

This is unrelated.

> @@ -1745,24 +1746,24 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
>  }
>  
>  /*
> -Calling context:
> -The caller of the sub-routine will be in critical section...
> -The caller must hold the following spinlock
> -pmlmepriv->lock
> -*/
> + *Calling context:
> + *The caller of the sub-routine will be in critical section...
> + *The caller must hold the following spinlock
> + *pmlmepriv->lock
> + */
>  

This is unrelated too.

regards,
dan carpenter

