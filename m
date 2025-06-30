Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3047E28AAE3
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297735; cv=none; b=Hsz1I0af1uEnXgNDdp/lCb8/femioUZcABFFP6IrBpzl2xYXR74XUNDp1BMV0ifGDIghJxNBRTyKES4LV8pOzoCxz84dDptP8+mVWT2P19JFgbgozS1goj5leMy2wgEwGp2rEbAtJfolhx7wWdCSoa29huLEa6fLRZXoCadhJTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297735; c=relaxed/simple;
	bh=WzUsL62s99aMQbncJlzVXJNCLYFnik+CIGI7EJNTcOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SyOVc+atXVjMMDDqOi7uX5WmAD9D4WEUtO9LUqi8AklTmU/qZfZT9j3WFiXzBck9wXZCf30cnheBSoViGka8f2O1O50K8YhI1CyvwiYOPXi3N4Qyl8QI8pEINYuZzd+6AnqALUmTSh53iQhTRtiwJ6OVoaWqnFAvhIghQLAcz44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ByZZzgEO; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ByZZzgEO"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so488695ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751297733; x=1751902533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbO9psxgk55oppNmRGWDGVoNc1FLKxrpCgi5quujmE0=;
        b=ByZZzgEOrsnKfKVfx0kLc6+wQRCMi30ELjB5ZTTNVkJ+gY7CSb9cYvkof+UsdCR96w
         ULMiQSG1+HV/Zv72bzEmiXP9e/lFQ/q9fpqD2OdZaZgafwKkn6fLLELouDwGCf8OjAGN
         FbxxmF/WpKY22R0gceT9HfVP8WUTM9DndZ5OAtzDExAAtY0b4We7Jl+DDSVyYsdiatyz
         z51RYlMMsCznCrJ+EdsCcnqcbNJBTN6WX0Mr+2+Os0bloILRu9wy4GxlZw6I/UOW5K4D
         x7nEtlFloWPa3fl2SfpVrChHgT2FdyDXEe7rjKeBi2Vxp2jtt5MB1kWBjCGMmh9bFuxZ
         /M+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297733; x=1751902533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbO9psxgk55oppNmRGWDGVoNc1FLKxrpCgi5quujmE0=;
        b=l3APyPpOdlvJGZG+Ug3SXLiK2QeSVJ/WkktIDVjMBX37TA8ir7mPud45sAeGVF8wMd
         oPVSa7FAouLncTNcdqzI9LusOPgtpT+fvU06V32bNJrQma3AHHW0muV57dFW5uOl1/se
         7oFs4Rq+rU2eb9kk0KSajw9n4CxeGp83riDuv/L+mbVQnyqPkz8go41eamAfaZW5qiaW
         pytmjKHCB2qI2JMExujLLIDCFyQirDQjVykuM70gGgOSMqkQK151GwkE9jVaGXzj+UTX
         0uTSIzjaEHmdQaHyMj8mJRoqSZosskMXGktyz5HCcXs8Ny94IFRXMgyHSnN2O9KRTpex
         t2RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfrpZFOXqwfIsHfR6gTDY45GpkSKArN2EIhvrCfej2FrtiHTq8YvI0tbziva+5MgWs6INlZcxm03zwfWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrU9GUZDEzeDw5nRWsFcPKnzgXl13FT3dvhQUqs0XZsyjUCh0Q
	zUUgXxw5WahHaGuD80abCpfo113Hwf+kuEiTcnDAF7kde2akvQrwL8Mfvyi8C5boyVoqK8G05MT
	uPfdQfIjRodIVtJbTvvWeVfr9jbBoccCLQGTM/Euu
X-Gm-Gg: ASbGnctxmHwC3NMsWBnyVnKrvoiO/yY9Zb3rhAvMJpRl4BFcazLJ/kLRJ1ln/yvC/8J
	RtQJhG92WSI1H15udTx5HUXh2GJM9o+a54a2FlIVhbMHFmQqKP371aZJcVMYZseS9q/Fx008Bwo
	UdmeQ4rqPbpwGnK1QWZtYsuIP44eGegbnOgqR6X+/k+VXfCgpXf72CQtiLJdzKOBFapkDv8vSk6
	gGIbsoBfA==
X-Google-Smtp-Source: AGHT+IHOX7kF7dn11PIYsXqc5Lvgd9CFgVl0JgQOIRErwaVxAn3VrCW+V5ML7ah9kVF847kUzTGbYaJQz6lAmBOdyCw=
X-Received: by 2002:a05:6e02:1a6c:b0:3dd:d664:7e0d with SMTP id
 e9e14a558f8ab-3df56d1d4famr6330985ab.25.1751297732904; Mon, 30 Jun 2025
 08:35:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org> <20250605-james-perf-feat_spe_eft-v3-6-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-6-71b0c9f98093@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 30 Jun 2025 08:35:20 -0700
X-Gm-Features: Ac12FXyUBSBjSl_fXOEDXQ0KnLnvxPP2kraYhFsM6cPyGu_cMbUCD4cbUl7FD2s
Message-ID: <CAP-5=fVZjqapNHhZ_Gro39JmJ-57nEun-SQhM_rd=MkQbx3GLA@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] perf: Add perf_event_attr::config4
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
> Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
> packet using another 64-bits of event filtering control. As the existing
> perf_event_attr::configN fields are all used up for SPE PMU, an
> additional field is needed. Add a new 'config4' field.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  include/uapi/linux/perf_event.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_ev=
ent.h
> index 78a362b80027..0d0ed85ad8cb 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
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
