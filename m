Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295F521B19D
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 21:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738704974; cv=none; b=VNJ6GQ2d4+Aew9m/CfTJnLOCc4wnbUw/DjTQtBSyuwCersTzFLpFoP+wmQzZg9y20QkXvRl0lCOXeEXBF1U9X/dF7sK1jw/Y8IzegvjU8EDbVAk7euILOZmd0vMDZU+jKUWDjTY1dixWskURAhOoqxdkT+iKKEhEWYtnIvV7AZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738704974; c=relaxed/simple;
	bh=bT7hvS/ZYY6Ak4uuMsfFoKJXK/xQE/NGQVPJdiI4sXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=e83D/uNg0GNkqEmFj5xikkBoiyP/2QyvKo4pqbajpFEuK6OaX5LpEdKox8QUQRwT/aYcQtIyMVuN9+mgcQ5Dx6XH06xfUvDAxuSX40ejmv0CHqxmhTJByly8Mapg16PAqSa6wy780E/nrzpwFcrYOwhPW0W3e7PF3GKveu8E7Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cwW+1/xf; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cwW+1/xf"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d04b70fe79so76475ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 13:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738704971; x=1739309771; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyqnYt3RtRH3y8pJQLi994V0D5622X/Hs/LqyBZBhrU=;
        b=cwW+1/xfjyV9fz+lfE439yRWMgHC8igpnR2zkM4nmboya2nB3F1bn9bTfh6aBIRzm+
         I0Rg6LoEZnsbR/KNjBT6FAm69+Q96QcACx70HECK91cDcs3oON51u/Xq9FhzZqG7yqj/
         YTetbyd5iHYVXRvLqAu7GLGQN1pV6uvEUxIsv1hafAYNhWotxxOF062sWoiOZWt/WPVo
         kN/9PlemGq5drE04ofQm5INJa1XbmsJMrlHgAOcBaWhQwKnQDL/Bk3MHcv51/KVqnNN/
         gU4GYZR1l1z09HruVEFE4ZSPdmBUoAVTcHSUOsDHszWoBnIj2vf8Xp4sJ2K9B7H6qHwK
         pbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738704971; x=1739309771;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PyqnYt3RtRH3y8pJQLi994V0D5622X/Hs/LqyBZBhrU=;
        b=HoKy6k/bYX8mU1X9z+eoHClijQ9Ki/jKLVqJQO6JLoerhG3LhEGrV5skn/vtxuqNd+
         hB6ueMgA/zAYGGVvHRVYBtnAG+0UNAVPvNTn2SYy+NmyTopS8W2B27KO1SGJ/+s12446
         2MnbswUH0MECdTCb/99vE8Sa/9SpXfCCwU9ScJ8klXBIvn1CnfbOe4EQ94ZHgggBUE9U
         r75rWy3ybOBZpAzJG9CCYIJJYpmhBVcPz0KMKCFoZreZo8GwM5c3qrsnh5aMXprjPXE7
         esMieu+ro/vBt14EU0JPLP3n0BQlK+VSZeaBrgnMcEjY6YuMTGYY7v//niuxtAvWZvq2
         pGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW2H7tSw2N/YRrnTQWStWQzyiSIfSiwwrijyTggClptuxh6c54d2oreLZPzVlmdpaZSW+3acba4Iizgsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqMvdtxP6xdhBUwAAFsbCzMTiBHJz6umrRASIkSEpEhwWHWSe7
	+Sr1qlrIPvPJaLt/EGxiKmJHxzvcqwUPy2ad8Rj2vwS23xSqoytNKHy7KsXN0vTD3AT8fAHWqIF
	/k3jX6PrPHNnvNunqP0P2Lq9Twbl5VqJvts/d
X-Gm-Gg: ASbGncszq0l6G0PROSIofjOr8seA9cSVSfkUvW4V9ygryWiOyH97/JXECr4kFfKn4hu
	ssFnkTBSWr2bTASlJXJrgJ0mDLecwwKo6HTeTunshrKFcYehpnG95eTxJakghODAGtuGHLJB5xc
	Dacv5jZvGdl9SuyjQ8obWepg1B
X-Google-Smtp-Source: AGHT+IEvGqk3JKeKBvN4xrv1v5kK2jNOZhYwNebudYCprfH6LzVQ0SNVV8Odwhxo5sNMhcUT7RwwwYMyoSfdIwaze6M=
X-Received: by 2002:a05:6e02:3cc6:b0:3a7:6126:ca3 with SMTP id
 e9e14a558f8ab-3d03fc62e21mr5703915ab.24.1738704970969; Tue, 04 Feb 2025
 13:36:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204213259.127939-1-irogers@google.com>
In-Reply-To: <20250204213259.127939-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Feb 2025 13:35:59 -0800
X-Gm-Features: AWEUYZke3Vm-fYtRYAFOY_ga8pxmzbMpH61s5zB0pRVidP-0XGKJYr2PjA6ZHOU
Message-ID: <CAP-5=fXpuND+kNe16CJMETkMOW+__eQpB8No0ra5gyEcfqCCKQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] Intel vendor events and TMA 5.01 metrics
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Weilin Wang <weilin.wang@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Perry Taylor <perry.taylor@intel.com>, Samantha Alt <samantha.alt@intel.com>, 
	Caleb Biggers <caleb.biggers@intel.com>, Edward Baker <edward.baker@intel.com>, 
	Michael Petlan <mpetlan@redhat.com>, Thomas Falcon <thomas.falcon@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 1:33=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> Update the Intel vendor events to the latest.
> Update the metrics to TMA 5.01.
> Add Arrowlake and Clearwaterforest support.
> Add metrics for LNL and GNR.
> Address IIO uncore issue spotted on EMR, GRR, GNR, SPR and SRF.
>
> The perf json was generated using the script:
> https://github.com/intel/perfmon/blob/main/scripts/create_perf_json.py
> with the generated json being in:
> https://github.com/intel/perfmon/tree/main/scripts/perf
>
> Thanks to Perry Taylor <perry.taylor@intel.com>, Caleb Biggers
> <caleb.biggers@intel.com>, Edward Baker <edward.baker@intel.com> and
> Weilin Wang <weilin.wang@intel.com> for helping get this patch series
> together.
>
> v4: Fix TSC events on hybrid mistakenly specifying the core PMU
>     inhibiting the use of the msr PMU.
> v3: Fixes for hybrid metrics that were missing PMU. Update to the
>     latest events.
> v2: Fix hybrid and Co-authored-by tag issues reported by
>     Arnaldo. Updates to Lunarlake and Meteorlake events. Addition of
>     Clearwaterforest.

Sorry, forgot to add Thomas again.
https://lore.kernel.org/lkml/20250204213259.127939-1-irogers@google.com/

Thanks,
Ian
