Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45931298CAA
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024565; cv=none; b=T2MtWJggtKxBog9LWYCLRqbfMAbnZEvbNWqFBoNwj7B7y/WEZJ/zCYYdq6ZivrZrnaE8H+ID6lVr+QtiKtryPw8InU0J9yQrmcZ4O1mxYc3VOaAXBuxMtXmLxxgDUzxHQHTjLO4hAPadaoQzhv+P3xdIRYrLBZmgjvq/RFq1OZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024565; c=relaxed/simple;
	bh=s/6eqYOTLrxmW0LGX7eGemIDLzBddKua1DF2bww+zAo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=anLkKWUt/XhHSjFYlOP5cWz71xMMZoyQXIiWgccMdWpT3Ff2oZvjIdWgUQr9Qs6+6w/7kqbQiRC14Ds/RLEgDksCDwk82jxnBvZxZZmdvc/nf1wCxN7ArEZRjT6NeiuVDQmr7OuV5V8DrNTk3GSCk3/jw9HD9oXovhnv5BCo4VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1M3Gq0sB; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1M3Gq0sB"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fa9dced621so220266d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748024562; x=1748629362; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BClPbehAu6JBgNUB0ZQty6Cn+WSxNViJiPjUPJj/yCw=;
        b=1M3Gq0sBFkRYElwIstMMRFgXHLwAT7q0n0q6HybokgkH4buOU9ce3/qUMheQIiddgE
         wxpBPFsnsTSg/xTpG01JsO6ED44qToFo1AjBnYHrP/IrLhuNuaovvgi3nlxKjjX964LQ
         ZAw/NLGgXPW4WyA+bOOjOv3Mk/0Jzy4GiBKxhaGdWUOKl3Gf1/v7qv19yeaDRvRDnfif
         KZOKe+Z/GAF8lwTFOZFtZ23RFyZYK59/Wwm6idyvXIwKpoh96XMNDuaD2AtBpuWvatoG
         GPdUcDc7Lrcof2osxKHPTJSe48StG/ubpOcMjYdBNYR+tB7rjdQZOaYOb/ByYLXkdRGQ
         TojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024562; x=1748629362;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BClPbehAu6JBgNUB0ZQty6Cn+WSxNViJiPjUPJj/yCw=;
        b=cLU30Iac8RcZCw5bgI15gGyGP93ocLhq6HvDZFO35Nj3UWdGu5KY1gteGfrtAQB45l
         ZHZ23RTEHnwIGk7vZOdSd8HT+qBLHQVARvR4Z6+xBdT0bYegQeWgda/N41DPqdWimOHD
         eGvx0IxEbd7jvRN/5IGGdS4FdGUmaImAxB8WicsL68Jy7dAtZ80BAgNIvQEbS13JYD47
         Coe7EVxnm5e9cq+5/a8KDmP23jkhsXOoIPgxxHY7hXsa41StImgnN8eGK0vxr4T+1iH0
         FiSyukkn9LPGMBYJLixKRaZHla6gNsfgtvey9Dhm333aGsHxtdQaWbIVjEWsRu4f10qZ
         2nyA==
X-Forwarded-Encrypted: i=1; AJvYcCXKKpI/UPl+sd1X3Fa7OEqnZzhQXXHlqeZJ7FcT64a+mNs2ozs15ySyTTmsRCsQJ9j5hob2TqVh6LYx8cs=@vger.kernel.org
X-Gm-Message-State: AOJu0YycVKlX0uoBLZ5FSGu2Ypj8Xcwp52H0yVz9d7E91fEUPQuFDN2e
	WMA1uKYQdbOJbmPo6UsQu/Njgff1L1k9zdjKvldy6NfCJbMU5ve2YMl2SgdurvWkQAov0vP8Hrx
	3RZ4z
X-Gm-Gg: ASbGncsQcmzTN/WiGv9kWY8kkQdHszymiyPCSr7zzA2ac72z3AVJUtuAYAAxpy8uTZf
	+2xK1Icm1SvSCpLzJf6nsGMnCZqFMQoM1trn1wc7se8YPe5W6rfQcVaLAehj0ebqamnc6FfVgVm
	LaPve35Io7kb0jWmtUUMuijktZhCvZ/YkdVhaBdpDifSFE6tHq0ML6m6U3zWF0aCnkKS/eaD67h
	g5QpA1x0gIpoiBpvYuHIUmgx1y9/UwxiuEITL47owNxqCQ3lQ57heaHrRsjrSjZZF1dlA/BRMVO
	UwcyOsCfncbSc0rBi62j+XJw/JlhZe54VIxh2EjUKOOQRc1jcyd+iFGrVKO5imXo56GeU+nge7V
	p7PllVbta8XurcQ==
X-Google-Smtp-Source: AGHT+IHtcqZzqfWbk5o/UzOJDRxNNio2Z/lxjmpT3kSO+7xSuTcmZ2FTV0xn5lzDCf4Hua7Q5fv9Ug==
X-Received: by 2002:ad4:5dc4:0:b0:6f5:1192:ccdf with SMTP id 6a1803df08f44-6fa9d139408mr6440336d6.6.1748024562089;
        Fri, 23 May 2025 11:22:42 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0898f66sm118824496d6.27.2025.05.23.11.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:22:41 -0700 (PDT)
Date: Fri, 23 May 2025 14:22:40 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vt: remove redundant condition from redraw_screen()
In-Reply-To: <n58o097s-s20p-4222-nqo5-2qp26843rs35@onlyvoer.pbz>
Message-ID: <srp75229-623q-q31s-79op-076nqs4so36q@onlyvoer.pbz>
References: <n58o097s-s20p-4222-nqo5-2qp26843rs35@onlyvoer.pbz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 May 2025, Nicolas Pitre wrote:

> Given !con_is_visible(vc) is the equivalent of *vc->vc_display_fg != vc
> we have:
> 
> 	struct vc_data *old_vc = vc_cons[fg_console].d;
> 	if (old_vc == vc)
> 		return;
> 	*vc->vc_display_fg = vc;
> 	if (*vc->vc_display_fg != old_vc) /* !con_is_visible(old_vc) */
> 		...

Please disregard this patch. Obviously the last if substitution should
rather be:

        if (*old_vcvc->vc_display_fg != old_vc)

and there is no guarantee that vc->vc_display_fg and
old_vc->vc_display_fg have the same value.


Nicolas
