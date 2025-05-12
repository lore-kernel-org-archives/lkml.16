Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7C825C6EB
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 22:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747087230; cv=none; b=lI+pOsoOWMIK6sxVvIy7G0tgvl9nPfEY8FAHVzS+ql4WMwbIXo/TR2pbviBHLRNPsneOqeE+ir7ZcxgkO+UlM/UyWqrL5wN4FXdlMSqo9B4IOYMaukFFcq5VnTgqhSgoPqNT8brJT7RpAnAyeXT42KaG2hs3sZ79Gj67auQok3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747087230; c=relaxed/simple;
	bh=diOLJiRZFSJh9VcRUsMpdMJALVTGuXugiuhkAFp4UEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMQYfdsF6sUTg742xwW0Q2HIpJfblgF6+esOAYunu9E0MSf8P4xVQzW1R2KWDWR/U+hFCEKOVDo++GasuM8gbG5WxhG5LTOHWBt7E7jkl3cNJFA6tEqh50Vj9FWFS4mUlAGW1r26bDMu6Xn3w94F0jfPjX6GjIoHA572MukFPmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z+3Kztxl; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z+3Kztxl"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-740b3a18e26so4181149b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747087228; x=1747692028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5l00tHt9ZJ1/pub8XJ3X7haVxjAb2DQwjaiKyF9pcNQ=;
        b=Z+3Kztxlktu/tR/kD48rbzqUgrI4TMHjIp7atnZrv9QKZjnO1+jOPb7fa46SaLxRga
         HEQBk5CuzuzOFZz9Et3w05fpjEcKcemuYechcpBYxBXenDRbGDVf3j6/tvfqYiQJO5t4
         3INkCnti8bcittkboT2cosiLU3vY6vJTtT4cb93yotAbTaCvsepzHYnxhIo9+PWdIehe
         kGOAk0M02hVIBfRCyrcn9njBme9nUg6C+t/+5rZPKSnhGJ6l3945Ti4ZcQCGY6GjE8lM
         V9kfdtruF/2RCpvY3uoMNyvMrEFBUSTIfjD7jfwgfiWVc5UTwdSupoKXpsIFL9N7xpju
         KOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747087228; x=1747692028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5l00tHt9ZJ1/pub8XJ3X7haVxjAb2DQwjaiKyF9pcNQ=;
        b=jNfxb0++ru1cLQ0flBRk7UP1XnyLLSS3bIz1WFOdlmuWJ+KeiZY3dlkdY0weeA+85l
         liAwIw0dA3/MgXtVB25zsKpIufJP+XbTuEy03kvkOuXk/L7cuVtt1BQeptIYYHC3v7ZU
         GjfUExQokP7G5IlluT7k4DCu7V8Y+Cw72dENCcY0JPUI0Qhk/jh2y+S4SxxnFPoqCFSz
         HnJ/0NbZcWswVNWG4yWI0KNiOPF4rbbdxss0AN2cF+x9XOM2RbunqlmHTJQkgUFBDR1r
         r+0H9iKF78pnVEtup3pgVwCPQ5GXWI7BaKy/hkVozHGYvNXF5w9icr4d7+Dw15cUm9CM
         vyRw==
X-Forwarded-Encrypted: i=1; AJvYcCUhtSfelBOuB1PLqVd1pFStAOWfZ2JkqWjy3zxkVcZfESZodfxZWaY+wSwaBeo7tmYrTQ/PDUbw1URwkcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYqWYQFQr2cdV/yWqouIDROLcOd0bqZqQL+9zYD9c8KptUmJ2T
	94kLc/PPuDI2jydy/0XIIVXkft/QMYwcFLLVUW0oQutFzAA2W3QbrCDfHW+Xrg==
X-Gm-Gg: ASbGncvJlJ1HQpJzhH0Yrd0P1j/AONXHQXlfzn5zsg2/IVCRhnySng0plWZAxXONJsg
	a9s2vjB2Q3qTdocVDYDx2SyWU7LaGHtkJpoB8E+Rh2xDNYlmLMj5qwYRyRpsePrCDNh1PIe4xka
	Jz4kncUqPmOfO9u6CmPkzWuLnuVclumQ7pr0gJ4JGmmZ+/H3X/FmQ8BTBNAcrE0qTAes8lcZR6d
	1U+1IbXbfvz89rczwO6rsRycuLZkH8VWeSuam/w9G8RA3Lbc5qa0ACtvuQYbXvOxi6k2YDARoIW
	cG0vIHksJJ/3pZw9OhTx9sCEErHUYmFZkbKsxOYgLi553oGyY7oqusEEZjHOhE7dcRAUMZFiHRr
	MXto7T+3eXqoMAOW1b4d3L1n5ZrlUGzlydrTqIeZgaeZGyFMQmw==
X-Google-Smtp-Source: AGHT+IExj3eLQl26ZSvC2WJ+nSHOB4LhkmFdvTFL4ZsuUWO5eYrjUAy0qOg+cFqUIpnUOL1QIlRIzg==
X-Received: by 2002:a05:6a00:802:b0:736:4110:5579 with SMTP id d2e1a72fcca58-7423bc02f2cmr18990453b3a.2.1747087227689;
        Mon, 12 May 2025 15:00:27 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:7:464d:e081:1c2c:7358? ([2a00:79e0:2e14:7:464d:e081:1c2c:7358])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742377050bbsm6596858b3a.27.2025.05.12.15.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 15:00:27 -0700 (PDT)
Message-ID: <cd4f50fd-e418-45e0-81d8-0d34a5431a28@google.com>
Date: Mon, 12 May 2025 15:00:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: tcpm: Use configured PD revision for
 negotiation
To: Cosmo Chou <chou.cosmo@gmail.com>, badhri@google.com,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 cosmo.chou@quantatw.com, "kyletso@google.com" <Kyletso@google.com>,
 "rdbabiera@google.com" <rdbabiera@google.com>
References: <20250508174756.1300942-1-chou.cosmo@gmail.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20250508174756.1300942-1-chou.cosmo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Cosmo,

Thanks for the patch!

On 5/8/25 10:47 AM, Cosmo Chou wrote:
> Initialize negotiated_rev and negotiated_rev_prime based on the port's
> configured PD revision (rev_major) rather than always defaulting to
> PD_MAX_REV. This ensures ports start PD communication using their
> appropriate revision level.
>
> This allows proper communication with devices that require specific
> PD revision levels, especially for the hardware designed for PD 1.0
I didn't know PD1.0 is still used.
> or 2.0 specifications.
>
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a99db4e025cd..5a58c21c4d14 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4782,8 +4782,13 @@ static void run_state_machine(struct tcpm_port *port)
>   		typec_set_pwr_opmode(port->typec_port, opmode);
>   		port->pwr_opmode = TYPEC_PWR_MODE_USB;
>   		port->caps_count = 0;
> -		port->negotiated_rev = PD_MAX_REV;
> -		port->negotiated_rev_prime = PD_MAX_REV;
> +		if (port->pd_rev.rev_major > 0 && port->pd_rev.rev_major <= PD_MAX_REV + 1) {

For better readability, I'd prefer you use macros for the numerical 
values and implement this logic as a switch case. This would make the 
value difference between PD specification revision in PD Message header 
vs PD max revision AMS transparent to the reader.

Thanks,

Amit

> +			port->negotiated_rev = port->pd_rev.rev_major - 1;
> +			port->negotiated_rev_prime = port->pd_rev.rev_major - 1;
> +		} else {
> +			port->negotiated_rev = PD_MAX_REV;
> +			port->negotiated_rev_prime = PD_MAX_REV;
> +		}
>   		port->message_id = 0;
>   		port->message_id_prime = 0;
>   		port->rx_msgid = -1;
> @@ -5048,8 +5053,13 @@ static void run_state_machine(struct tcpm_port *port)
>   					      port->cc2 : port->cc1);
>   		typec_set_pwr_opmode(port->typec_port, opmode);
>   		port->pwr_opmode = TYPEC_PWR_MODE_USB;
> -		port->negotiated_rev = PD_MAX_REV;
> -		port->negotiated_rev_prime = PD_MAX_REV;
> +		if (port->pd_rev.rev_major > 0 && port->pd_rev.rev_major <= PD_MAX_REV + 1) {
> +			port->negotiated_rev = port->pd_rev.rev_major - 1;
> +			port->negotiated_rev_prime = port->pd_rev.rev_major - 1;
> +		} else {
> +			port->negotiated_rev = PD_MAX_REV;
> +			port->negotiated_rev_prime = PD_MAX_REV;
> +		}
>   		port->message_id = 0;
>   		port->message_id_prime = 0;
>   		port->rx_msgid = -1;
