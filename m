Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E024728C854
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297806; cv=none; b=bYkIg2U7B/d0PZAEFacsRqafOHEoZ+Z74XuR/OYeujgWsQn/lWyLdB80Mx1k571bwFsF/Z1tqnC1zoEx5LFRUbN3OstFTM04UQd12G+nYngfTUPhknVOH7UWTXr+ZuZD0wRyyjhm20AGVjbf53vQzOXW0jh7Sq15JmAdO+/lP+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297806; c=relaxed/simple;
	bh=ltzjsZ3Y13JqtrnFJO+zsCen5wBONE4sgDpdbeqPl3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HceR8qFy7s2JuuP1m/D7/IrEKAKtKkkGxBXEefecW3t57/I20sGEaUM8G44Hqw45ELI1vI66HZvT/e+xw4wr6o6FfTgrQI5QObBgoltFqyV08H4/5WgK7z1+2HBwIldJ4rx6HNC+gW13/1bShCouRsS1gPz/XPRHb3AFO7FOPrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CSgBgtvv; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CSgBgtvv"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3df2fa612c4so530715ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751297804; x=1751902604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3GKh4o61b7jyIv0Cvm8DV094/Zex2HvCho/VCSf17U=;
        b=CSgBgtvv5G7sGqntkhJ9oOUS0AnPDmno3TFJMDNfDAAb1Iyv/sHk8Z0fDcUkwwh2/b
         6EiTkjt1Ef/SCyM8sY6swH6AaMdOjz/JmTYjmawTKNAcObWMKishY3JA5ojEJqnfvcZw
         Pva7RJdNZj87JvJMzfYzo/B6BN3hjwl+t4VzuI7Sa2KEsib4lCJUdHZXTBKwx5u8vFcA
         HYz1FWuVPOWTAAbxVla5xDVIABfmhfOABd/2Bx1/ibtbovp8ji5givztVJ8Qoy5i9gwO
         SgWPCLfZzHeD5ieMj064hhlhS5OmG38X1I8Gp5ZMe2Qz4eenLdYNxITXeIHsGKEmIAHT
         fTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297804; x=1751902604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3GKh4o61b7jyIv0Cvm8DV094/Zex2HvCho/VCSf17U=;
        b=sPbMyCiRFpyB6eFIoKYg4lY6T9voOq2mYEUdFWjCkAvE5QyaZ/WufWCtmnneErD/Aw
         Mk2sy++F3n4W6MtS7tYPH+t57IiSsWaV75S1G9p2y+kLVPU4zJbedLQWrTN1REhAqdC0
         9eM021yNoe/8nhKg6qCV0CoSQMxH1ltPkG2waEeDnRzqGtwi4gXDIi8FyzZE5pG7R8nj
         Rnz6IaIF7cSDRNyTufsSG4kjX4tV1aSfBpNN5s66kP9k8ccObNBXm7RlLH86Uwu21BZO
         JuUcIVhsW5wIdQiwV58LVnf4WfNhssVtlEaSU40Buu7RSAytn+BFWikn1aMU7sEpk6lu
         xWLA==
X-Forwarded-Encrypted: i=1; AJvYcCX28ta+6xyb+CIzxvlfHYlwPLokkVGX+CXmdx8k+Io8r92Bc4vKMys7HaPEYf3a/uEwx+FgHpq/eY29spQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYptGJjQZU5beG4t3zXupAmUSCo2aLeKAab0ToxqTIV1bS/f4n
	zlKePBgdpueZZs0Reyy01koU1XnSvuM3OfFujn7ccBe7Z7gisbpYQots3TZgjEpfmPaJ2Ej0lNp
	bEmRnkNUMsSP/iDFwtUq0EKMB+dWJ30Su1na9wRWt
X-Gm-Gg: ASbGncvqd/YMxzyKcBQfYpgqx5CdwFYOPM0pwMqgfTcbHkhtzZ4cnHPCDQr00oqX24r
	4lsd0rpfk+4zjifyIpPkuNREqrlVbHuleUkTkT35epV1Aaad5mM6WIBhdG43+InTUdRVB1aWWUW
	gAaNPr5dcvdJ4T9IKxGLkysxHqZ2dyGXQqnJj7xCKDa6yRmyjnlK6+lX22iKHr3qduDid/6dc=
X-Google-Smtp-Source: AGHT+IHCeL7uDDU5JOMczoHemzrfltO8zFE7mNOcumLGxZUSHGclDw+KN2fxow6X8OtdYvZ/ZfmsVer2qBLOgVRnCKc=
X-Received: by 2002:a05:6e02:11:b0:3dd:b59b:8da5 with SMTP id
 e9e14a558f8ab-3df55381c7amr8226995ab.0.1751297803769; Mon, 30 Jun 2025
 08:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org> <20250605-james-perf-feat_spe_eft-v3-8-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-8-71b0c9f98093@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 30 Jun 2025 08:36:31 -0700
X-Gm-Features: Ac12FXzGjtf9e7aPdAU9e9fczw6vLUTz8vKdx9vV288aJS8GZ_7quQwpeJqa1_Q
Message-ID: <CAP-5=fWuKrtRy5NdPFivjSKx-fbw6P49QFepg1-1qUB=0guu_Q@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 3:50=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
> To pickup config4 changes.
>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/include/uapi/linux/perf_event.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/l=
inux/perf_event.h
> index 78a362b80027..0d0ed85ad8cb 100644
> --- a/tools/include/uapi/linux/perf_event.h
> +++ b/tools/include/uapi/linux/perf_event.h
> @@ -382,6 +382,7 @@ enum perf_event_read_format {
>  #define PERF_ATTR_SIZE_VER6                    120     /* Add: aux_sampl=
e_size */
>  #define PERF_ATTR_SIZE_VER7                    128     /* Add: sig_data =
*/
>  #define PERF_ATTR_SIZE_VER8                    136     /* Add: config3 *=
/
> +#define PERF_ATTR_SIZE_VER9                    144     /* add: config4 *=
/
>
>  /*
>   * 'struct perf_event_attr' contains various attributes that define
> @@ -543,6 +544,7 @@ struct perf_event_attr {
>         __u64   sig_data;
>
>         __u64   config3; /* extension of config2 */
> +       __u64   config4; /* extension of config3 */
>  };
>
>  /*
>
> --
> 2.34.1
>
