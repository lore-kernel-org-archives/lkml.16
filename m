Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4FE26B093
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747668148; cv=none; b=klGIQgbGR0sfgrBAc/pL38natb9mVyzz4WbFdSlVdb1/RbtFhPzM762nHDpHiozQg4NfhwbRqlS9lH6nTcIMr3MT4gqn6PXkX/BcH8+mHL7hnqXwYCYqxvHivgVUy+6cdUQZlnoSgbLB45v1zmTd+BUIn6VVoEhgHQv1VUaFEmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747668148; c=relaxed/simple;
	bh=p4CkxdSpwoxKhGX1PMyY8JUS3X9caCIepN2G/OGryK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pnZm296oD9XtTUzE4jAc4D/DTHgAl2EKb/8y+C1HuxEN04AJzs6IDiqkFQVtQyLrZF+uh6/C5s6GLytwq1+OSAd6JLclZL+aVo8/JgfziWKZVmb3zr66gR9jfCrTM+OfA6vjqyuuxEfqaNIGXraV8VZGyyAVboIlwBV20DLdS4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NOyVp3Uc; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NOyVp3Uc"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2da73158006so2149470fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747668145; x=1748272945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qtqdqspNTvytDy8WFC/Wqlqs65C7PdRK37lEhGHGnU4=;
        b=NOyVp3UcztYhdMrfPtIwHprlOmF586SiJICG/u98SwN4hHnS+RN3IZsIAsufMubzvj
         DIHFtWOb3SbVI9cg4FG+oLKq01JGcSN64V1xOYpL7VWC76Gy4TpMRLk4Hh/Bv0tpIsCj
         8z+yqZg2h9qiZ7kOQz2q8SIUGfeQ/Clv8f3GaE0Zey2t3B+DJj2G6n4ve44QAInXVhfF
         7WWaCEQHfKOPiY2foFr2riptrMztE5XEMFIJo4AcAwfy9HXjKBEY5CNUDqG3j8dDX+Nm
         7gYy4rj4hI5alNG1QFeDggUUXy6YqftL6ovxEQnq1jIIM3rSTZ8S0nVnYnc9LpC4Ug7j
         UwpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747668145; x=1748272945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtqdqspNTvytDy8WFC/Wqlqs65C7PdRK37lEhGHGnU4=;
        b=fmgnn3cDpnwYahPRNqqoLOQaws8uk5IIlGWYQZ3635dm/sL1D+k/nhZOH6NOcMhqU+
         njFJfPUBhnNJmWH6yJR2eR7ANJwPqP9EzZSXGHb9DqmA/jwK7rmQ4AwwLnjoBm2r+fRc
         OJIb0NfMiNefGp4jOJsBHkHkhhVaWMEnm3Mx4FITF4WxjrkV3BHqvxkDorILdua0TAmc
         qFnw1RyhqkMcHD5uinmXYXo0bDKvsp57/kxHlTOtZ4b0NsG1uOggjZkuDkjidX52aux5
         nIvW2qjHn+vwQ2kGfKHXfMFqCNXSb0j2HwCI1shfbachC9x3PvnXT8FcCj9sP1CgYLHn
         4S4w==
X-Forwarded-Encrypted: i=1; AJvYcCVnhpGHn2EXrNp72t6CgkUlAn7CNu9FGtPNOvw7n4fXY0QQ589SqFt2NuTe6cTidjl9/Na2RYGGeFZtfEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr1lahtr1/UKtWoHRcPWpBfNMkINirbzumPA1KMe0+4uS76jgU
	g4/+hv4qcM8C4e6G2/gaeZghZaUEOUZEO7eLsTqLj8UnSBx1BzeDdek2hv5oCzOUY50=
X-Gm-Gg: ASbGncsW8ipZLJMZJIlS/as6SQR3koYyhY+ZVrxUL4qame4RlFup/nrBY2PFZQR3i1f
	96o6YiWswoZMY8IoKDr/0aLHCZB/CwVwQES4yITigIcW9T0zJZ4ItkJt+a+RMDs7vy6heGNb3nF
	vbDRUk2CO+yUsTfhgDhHfHiRl8klJWO9LwyKVKC52dsCDa7ZebFgV7U1q4jUehTO+s2iT3GX4uB
	tF64N8oW7XKslmBvFPKcKPLIAokJcEe2opdcno3Jk2K8seYzaowy1vBjvmeHWSfzbik7iy52GIk
	QWM5QBBQOHPaaVp1lYzsbvAk3I1EX0pOdThXAbQpImBNSRXT4bC3++Mk/o/SG0kSh+9xY+Siz//
	r9LzFDTUAVnwrIPsnmdsFEU+5Pw==
X-Google-Smtp-Source: AGHT+IH2otVyhPZxLp/VL+teUieHdCcA35d9h2jnmXZKnSkeaWPFws7WNcU20mosSx8Qw9AH8t1yUg==
X-Received: by 2002:a05:6871:ca42:b0:2e3:e277:4722 with SMTP id 586e51a60fabf-2e3e27747admr5863151fac.16.1747668145438;
        Mon, 19 May 2025 08:22:25 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5? ([2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e3c06083d4sm1798272fac.10.2025.05.19.08.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 08:22:24 -0700 (PDT)
Message-ID: <fc47b801-6d10-478e-a551-6a325c25907a@baylibre.com>
Date: Mon, 19 May 2025 10:22:23 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Add support for AD7405/ADUM770x
To: Pop Ioan Daniel <pop.ioan-daniel@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Herve Codina <herve.codina@bootlin.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250519140220.81489-1-pop.ioan-daniel@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250519140220.81489-1-pop.ioan-daniel@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/19/25 9:02 AM, Pop Ioan Daniel wrote:
> The AD7405 is a high performance, second-order, Σ-Δ modulator
> that converts an analog input signal into a high speed, single-bit
> LVDS data stream, with on-chip digital isolation based on Analog
> Devices, Inc., iCoupler technology. The AD7405 operates from a
> 4.5 V to 5.5 V (VDD1) power supply and accepts a differential input
> signal of ±250 mV (±320 mV full-scale). The differential input is ideally
> suited to shunt voltage monitoring in high voltage applications
> where galvanic isolation is required.
> 

Adding links to the previous revisions, e.g. on lore here is helpful
for lazy reviewers. It saves time having to manually look them up to
see what was discussed before.

> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit

Odd to have email headers in the message body.

