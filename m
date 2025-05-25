Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB8F17A2EB
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748156663; cv=none; b=V4B+9Zn4fGYuG/1+OKKuJCQz1lyexxI+TPyiAmKud3xAS4dieFqfKq4p9rTELN1+Qn0cHMVJWf8Y8f10bMWC3EM9NGKIUSxdb59Fzhc5hAe/2REA8BZnT4E/HhFbvrBicizWgFoERGuCIJXJZLi1QACZoz257YcID5LO/CFFqXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748156663; c=relaxed/simple;
	bh=NK9DHfY2dsc8jq9n6ZVImYQWBLnQJ77QjsmfzjQ2MVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKsdnJ7UzLfMo7M2PlH8H4cJ7wf5jwofQUyg7WY+Ct58LcN+7+jKRfswotVjL0GXlM0XkVMZ3VKUq3TxxegfqI7ea/K4BDHNNGAG1FDCKg5cXWg46J7PBk7YZAzQ27MNSIaDvIT6ciOqtoj3NU5+TcjBJm50pdjcPi6adpP6AIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gfnrMmva; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gfnrMmva"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-606440d92eeso548850eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 00:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748156661; x=1748761461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK9DHfY2dsc8jq9n6ZVImYQWBLnQJ77QjsmfzjQ2MVM=;
        b=gfnrMmva1AipO0tjHq7eaLh35PQMNDlu3LoWMoQs0ftHIkgXZULEaBufCfVEMyiot2
         vnRf78FHTJEBYGO0/KZw7MN/bgaVlfN8YopbWklrHBHHxC6PDcqu/Kzg3GWgZgsfQs0s
         TbyRrPt7QaDJL9JC7XrgXzXVmqmCPVITEgwhmyQEF2h428wQQZnImZGInoU8NAyaU/Cx
         9FS/Skg1yF2vnJszXgupqU5ErZvks6wpvaKF6kV5lx18J/CTJ8fkwWdzKF+AIdevCPcl
         7e7u03x1KPfDhvKM+o2V7n+DBZcKRelkHKuz3VxzH9JMXcmkN06dCl5H8Ct7oT79FrLD
         RBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748156661; x=1748761461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NK9DHfY2dsc8jq9n6ZVImYQWBLnQJ77QjsmfzjQ2MVM=;
        b=jrGDR5WWeOmGAI4OkcU/+3tgg5AF3Z6OGNodxLssbvZJx3ndagWPL31IrgFyvbyfUO
         /dZyAY6m2zk4XT9znzmJ8qDW6brvWgBKoj3mD2hnxTNoL9wGsJZyXgWba9dnf9T9uvvh
         m0CgrEBvEIJV9d18RokcXqTw3rDZYnUg19A+le/ccfqkV2Ydmsmd1sngLnAOOS8JJZLM
         A+IfnIpvQZK8cbeQPT3eZlIiDxFEaRyD0z0runPHvjvNIlRYf1G41CN/MBvuwRHXWXUi
         f42bYoJUr8ZZYnbBpD4TKyCRLQ59V3QYzMT+SgO7h5CrwRRBc3CcGY89MZGA9pg7gU2i
         cbew==
X-Forwarded-Encrypted: i=1; AJvYcCW9HLIURG6gqcCvgII3BpB6enM8bnLiJQe0fZwZSHKdG2b3aKt9OXmK+talZXpt3ysobDvHw64JOZdCsmo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Wa/imHFaoFswuDXv+xGkC0Y+760tpzgS+pXb7uhpabeRmH/U
	XbKCqrrCl43ZmqVG34j571yG77/lS9CM2G255rBU6hWfh9WqWpZCqsvNk//RKYBzeC5lJeNItGz
	hEBocEOGZhKdI4MLw8JnV9cRfK+wqO1UL/RfBOEebrg==
X-Gm-Gg: ASbGnctrwdCZsFV80lQjfsx5oI6qVjup67XrrD4dC+GIGV6/LVg+A/c/AWZNXSbXRfM
	bzeqYmdiMfItHP4SzD3ZffZuODxEDcuSKpevpRoxpACxg9TK4241HOP+YLrnRIAJvKFW35BT32j
	qDlQjkdPIMdi4PGJPSjlqI1rlLNwm7/TUuPUf/cPmU3wfqIXAyJOOHIiYqKO1frcHrLA==
X-Google-Smtp-Source: AGHT+IEobv1MmUdm3OhF2+QlgOMO6v4WRzce7p+hyeEZuMdsOou9ZkqZae4dTJbR6DrzynyTOeJDFtFyhDMmxSAEcOs=
X-Received: by 2002:a05:6820:138c:b0:60b:a44c:e987 with SMTP id
 006d021491bc7-60ba44cee17mr2124135eaf.2.1748156661280; Sun, 25 May 2025
 00:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org> <20250524-b4-max77759-mfd-dts-v2-4-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-4-b479542eb97d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 25 May 2025 08:04:10 +0100
X-Gm-Features: AX0GCFszlaYSVG9g4VM6bmqpxuLkf0fqSSgw3AbEnkb0rK3QTfE_tt5gub6lw4o
Message-ID: <CADrjBPrvr3F+A-MVAB+BLriy5orCGvBJmqrw0LGo_BaRpQ2YRw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: exynos: gs101: add dm-verity-device-corrupted
 syscon-reboot-mode
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 24 May 2025 at 06:21, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On gs101, the boot mode is stored both in a syscon register, and in
> nvmem.
>
> Add the dm-verity-device-corrupted reboot mode to the syscon-reboot-
> based boot mode as well, as both (nvmem & syscon) modes should be in
> sync.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
