Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40BB213E66
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680078; cv=none; b=lhtFedxN515zVuyABkvdmcjNjVaTpOjhOr7eMP93jM10PU7bBZRagBrG9CJSUV/ZiP9UQUrNw2iQnQOZoU55JczIxiZj+o3W92wyqmHCusJk4kU3th0LVsX0gVVY5+rIPNuEUPEgPfg+CQVl8AlR2OGGtRyC278LYkE2SEPgTY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680078; c=relaxed/simple;
	bh=xciwRpSI5XqyMyBnlUUeLe3S99Neg5b9gILeI/GIpwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1MMnRD8e+PECw3yWWU0pUkk2x+O2Y10uNOwoD/ZPQtS2seUZUU5sfRLOT3HgbAsAyXxvR8/GnhyQBrpBlRnxZBhQOcs2xNHgk00QtXRgZe7ttkE+6a9fntm8UfaSlUwSRvmfECgcW99eCO6K84N7t4+1RAIMLWypMC1LIc4W7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wpE5x9b7; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wpE5x9b7"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e46ebe19489so4588177276.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 06:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738680075; x=1739284875; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EF+r9NNxLbDk/ebkiEvokGAZWgyNc1LNBVM+BzVWg9c=;
        b=wpE5x9b7dNligu2rzSgThMHRj2bjED3OmxbR97P60sUYqed9QmLSINmFqyVh4tf9Gy
         YETKFfG2knPMlHelnGWWez2bk/3Z1iU3niAoUsYuR+DUjwsS0O5HOrZm7EoFg6sD0+sG
         4Wr/r/eoPT7AJLIso/EaCQqiUa3Aq3QlJsl/v43I7jJyLttHg2AIT4MgVy+CMgXIf+ow
         RHX0Xk1ZzV7f5/04KHCi80tM85w4l//QU9GcJsILw8+gy+oSATYhT6uyidP0RCDcbcb6
         BUFb+xsIXxhuy9qFQBbYwrZj4qm14vwUTGL4mthWv6wsTKOCtHbxa53yMLkMwiv8cKGC
         wrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680075; x=1739284875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EF+r9NNxLbDk/ebkiEvokGAZWgyNc1LNBVM+BzVWg9c=;
        b=IqqQ7HU31nhc8BbHByjOmYZbJctqZl0koKjDbuLNu14B44Lmj04GCJ2ukT00+Zdu5g
         4cNb7pa9TFq3l1pGDkKw43cy7XcKoH5mnWLfpHCuozBaRAcnqkGgzLoCq2XYq1t+XbKO
         yG+6ECGK84AFmsr0qcOSUaJr9ofWKLF+izvDXcho3E52WSSg7P925Qzs2Ifn62hkwFhf
         NO1+MujIwx8UnA4ZAqvOi2IaZ/vruL7a7EgYabOfDE1pghh6wUpyRtpJRtCAnewg/0ig
         TnrN8XSCcYtPQ8hoIt/GIvO968RC6YKjp2aTtu0TQHi79Y/Xlz2U4Dm+m5rQeprWJX9H
         pHhA==
X-Forwarded-Encrypted: i=1; AJvYcCX9MdAba/maN0doyBFDVsOZOjuKeuT46NcioPP4LjJPvByYgJUACvl7rkKmYTrzUOLDFBJvYvqlLHilckQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS2g43g24bct+pCgljaK2mwxzhDgH6NfHNiVm+ZUI/fd0QFBwe
	S1t0O69m3X9l893b7KW1pCPoP3JE0JMsM6JrIuvngDO3c0RY/nrJcQOIG93xfwpzd2t2548DzA+
	0xADsAOW8/Ht7hFSMIpvejou8vJyo36ntNmo+bQ==
X-Gm-Gg: ASbGncvjLjw4VcsTx8pR6WWKAZx4CoGRwZMrB9p529et9gAuajS3Hc9SQqg6ibPI5hS
	PH3hpy5bEgsUbzzHekHDRoQsVjgv8nuhs3mdzIbAJ1zGfl6C2m6bWbnY3yaxzL86JJEg9FJmLsw
	==
X-Google-Smtp-Source: AGHT+IEpnkfSycqPRh+Z07WB0BectMY1SNCWpsEsIbu8oOLWTzZvsbivUhx3HQINWbxmrSjJNPlwmk23VwhhmtN2WTY=
X-Received: by 2002:a05:6902:15ce:b0:e58:a221:3a9 with SMTP id
 3f1490d57ef6-e58a4bbe06dmr19324834276.32.1738680075609; Tue, 04 Feb 2025
 06:41:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>
In-Reply-To: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Feb 2025 15:40:39 +0100
X-Gm-Features: AWEUYZkH2hVyWKZ_6ijh2Gez9rMugPxnbEqXZ7spv-yBTuw-Kqn2vafUUBFeJuk
Message-ID: <CAPDyKFrARi_9Yy7155-XAkgz5LhzaERsuf5DzrS+H6Yb4AkRtw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: rpmpd: Fix comment for SM6375
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Dec 2024 at 17:25, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> During an earlier commit, the comment from SM6350 was copied without
> modifying. Adjust the comment to reflect the defines.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  include/dt-bindings/power/qcom-rpmpd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index df599bf462207267a412eac8e01634189a696a59..d9b7bac309537cbfd2488e7d4fe21d195c919ef5 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -65,7 +65,7 @@
>  #define SM6350_MSS     4
>  #define SM6350_MX      5
>
> -/* SM6350 Power Domain Indexes */
> +/* SM6375 Power Domain Indexes */
>  #define SM6375_VDDCX           0
>  #define SM6375_VDDCX_AO        1
>  #define SM6375_VDDCX_VFL       2
>
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241202-rpmpd-sm6375-06582e126d7f
>
> Best regards,
> --
> Luca Weiss <luca.weiss@fairphone.com>
>
>
