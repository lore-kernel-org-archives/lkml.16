Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0A6221702;
	Mon,  9 Jun 2025 21:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504000; cv=none; b=XA8pQ0nGja+p+ccHgqqnWBXDI02uCkjjrKkyUAuite3G2Aq/YO/8OXfviZC0fLnkJNeL6TA1zQytJRYOO0FLivJp+rByp23Qgu4GSBXGIdiBvi8qVRtpUpj280ZJkW9adqVMz3YOjg44cAc3epcQVPa1PsPBwuULiIInDq7gwC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504000; c=relaxed/simple;
	bh=wZ2q5oRo2lhHnt1Zf/N6cwzsOmNhhOIw7E8zYRTNPWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T93Rq7Od0E8TzNeLG06R7PoYNK/ulumBEStkSE7gobeyBGI5EXhKo82rfnNZH/d37zbcJ7LFz0FvTwK403ML55WZddVNIWAC4PbWX5S5Rc1//qnFf047JOW5egatiOg9ufNy9pPz9VClNdoItOPZ1x3po6wUZeI3hbfJ/NAM5wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/7UzM/K; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/7UzM/K"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2363616a1a6so2408665ad.3;
        Mon, 09 Jun 2025 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749503998; x=1750108798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93yUUs9R8gjdNL2MaOJ1mLM2XTPYgYceyucvzMsvIBA=;
        b=m/7UzM/KlkacvFS1+ZYGShnW45+ZvryHJDuy9e9lUZe1TpJadEReEuY3/dvT5k1Wzz
         ax5/sZsWix81X06Zy5A0d1jZH0tSzcA7++aGD9y4tViu6OWuLArT3sElKqpOfMoq9BxE
         sO3N64hc854SsocCrt4TOemTMHXG99+ZKLdp61Vq/aWCOMPn2tTM9njwXGqExPNC4J8e
         Zphd2I+MU6pdGTUgQqkEsgvzJpjVRkxhMgLxY8c/XkRDQd7t4LrtiOKMzzrYXoJ/txNU
         0YWFy0W+JXPXFGJ3oiYIX9PcR37itoqnL4G/tKru1h5SsLUPHbrNMPHGLU7B9qyGVq7Q
         q4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749503998; x=1750108798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93yUUs9R8gjdNL2MaOJ1mLM2XTPYgYceyucvzMsvIBA=;
        b=dte0WZIEBz96qEq8N2X/65xOErGCY5lBv3b77TAy68xQjFji7q6qbLMhsf6fOSnqcB
         Ctb5p3UWqFCwFcL2en/7pMYXie0Ogb2Lycv3Tlc+7UrgPM1ptcVXmG1nA1ROXR7QwBvl
         92AhEu6PfqYLLAcimz2MISoAjrMpeZ6u63BOGnPVwEsIxgQ/dRI3NTtu24dJbshc8rUS
         wnr4OUYtlPNNGs5zKvx6LGDBmwZEpQz7gbuY2bGY38Dj5AidQKYpMH+d+/+7ZIaZe9Zy
         vlvjk2PoJMmomO9tHmYIA7G0vlGDD8Z7odR7yJGAFw6UrwesdHXRiCtsnKmxSsEShVO2
         vJcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb9w3m3ktsh8fNWQYczkEtkDawzR+k4GkWQMDt5W4P43Vn5EbHbqyFpNJenTi8eyIFjiiIFhVl67Rlv6E=@vger.kernel.org, AJvYcCWzFsircIWX57M23QwFpmZggFetaSjflM5Ye6GR8NSEjz/EXO8Ny/+FcthtsGaJnoUFjbZlErAq4f1B6fFG@vger.kernel.org, AJvYcCXOglN/aEHpoQwGp6B5ZjEMOIUDleX+zrmFf4uLNRuQch+xC5IPS/P9ur19Iy+KIEknon6V1s9Wd3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze3yWkovy8vUggkG4KX1MAA4Va9RloJE8HbpcdCjWxqHQ1qfNt
	lFaCmwxSut6J0sVNNUR9lkqU7YJ/U0bZTUEUPy0kWvgwePVqXBXkFQhW
X-Gm-Gg: ASbGnct2AHXRYaSIMu86eu1a0tMdHMiTSZUounli+jVlxGj/FZ7u86slFNWlKxbNI+U
	0mYjL/YSDM1xGaYcPc1PwY53MraAOAkL5drHdsTTS3Xa1DFoVSncHOeMz/vyrDk/ttWpbW92bUL
	icNHhA883HCRkec3gLf1aEgDLlGGAQwrUBMVTvu4AcH/f3F4XmKiHDEEBNXqPfNiN3/m8m55T6k
	ud4k3AqWmglqPqB9ejcZuA1dGQ1QNsPYYJ5W1MDzc00eDlZwprqr23ybydpjJz1tTQGy4AiwKNJ
	Be7IAIAKVgV7Qer5h89bgn2c+4G4rwWJF25COuabQVRcTNID7zgKgQm+8eydxK+A9d/Tb4ARezo
	=
X-Google-Smtp-Source: AGHT+IH7tXDXZYprJolFVWFBtJyM9E/IDYlCrh8MNGncnPF2IA1P73suu74PB8V1X1zvIkvw0SMOXQ==
X-Received: by 2002:a17:903:3c2f:b0:234:b131:15a with SMTP id d9443c01a7336-23601cf68d9mr225387865ad.4.1749503998617;
        Mon, 09 Jun 2025 14:19:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236035069f3sm58753895ad.231.2025.06.09.14.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 14:19:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Jun 2025 14:19:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ProArt X870E-CREATOR WIFI
Message-ID: <3f935c58-5c41-43a5-86d2-e6320c058416@roeck-us.net>
References: <20250607102626.9051-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607102626.9051-1-eugene.shalygin@gmail.com>

On Sat, Jun 07, 2025 at 12:26:14PM +0200, Eugene Shalygin wrote:
> Adds support for the ProArt X870E-CREATOR WIFI board.
> 
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Never mind, applied on top of the other patch.

Guenter
