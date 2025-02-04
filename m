Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F1B4685
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695740; cv=none; b=u8YYOM7NTgV1cQxf/QdjXVTp01xjWtGXAgo/sxboy/KA+XlT7vxUU85ZqMSaX6s4O/36XLyR5WkWrjr4xWDp3rzDo1igQ1FQhNVV/U5KVAdAvYlN5dquSn3UiXJkgbmKNhUbNLurJAUPj2qDk5bsggg3gea1aUsRSO3jFhCtCpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695740; c=relaxed/simple;
	bh=pih8dX1QkofNv/xwIBaSWsmVMzDcnJG9l/i1Ocrd0qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlMhGq6eYrRGI1Il7u+db0ydB5twuBrAt+NpGqMHFzGSfXtZacT84ba6FRIRQQDFQ4XTGW/YOOQpNSRyYxcLrflHHUnrmBWm6dUSVDqDRvyIDXuDAonBdcmMt2nfkPOlFqMdWwOn7IoJgo5oxHTDOX6S5/3bt5VFmhGnaxjNydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wTeCCjxi; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wTeCCjxi"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d04e5bd797so22955ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 11:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738695738; x=1739300538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pih8dX1QkofNv/xwIBaSWsmVMzDcnJG9l/i1Ocrd0qE=;
        b=wTeCCjxitXd2zKWQ6Hi40u/YT1nfRVtLvmVvLxqEytpsnT31ADTThBnU/H4DDaCl1x
         QQrMVpEVr/oXzQOYjNFZCXou1f+M8/5yZCcEJi66KnLO7nWRjE1PFZxPcxNS94l9eKC2
         Vm+gPjKRjmZSK0v+kQDjbXcYdlOgiZ5ZzR0gj+ylVDZN2XYQjXqDci1LC4NXK7THM47V
         0eYbnDRnc/LPvA/eJPcODqo77PjRc3n8EnVLo6uI9ORUbHDLCs6/DmEfV/wcrmgQukEz
         oqAidwfd3SzRdcPsW/gLNR0kaXaJKmrVc9wWLTeQOctNGMBKYY6S8FtMkI4LGVrOQ/nG
         8Ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738695738; x=1739300538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pih8dX1QkofNv/xwIBaSWsmVMzDcnJG9l/i1Ocrd0qE=;
        b=N7NdIKIfTH5exsmE2XWXf/l911AcwAav7lqi9fXootNHxw+wh0T/o/80fj5yb9cmPK
         rBXl4o/NYOWJMmirzMUFSOPU1vILr+Qj4dTe46pyIanUBFCyy1IRi61pH6dM1TUn2jp6
         e9AJk58TU7EdDR4+60q2yj+kP0FlpUdTMF/yOVUJeOU9cM3/cm3U9K6zMAvNSnwfmw5g
         ShvlajLlWsMmVonjtj54nU4fHrroRL3UpWOyJ7Q5KPjXqY+BNId/h/Rj3x4f5QIBjNXc
         GG5EZr4vW1yLS++vHClV11YJQ+QDa/vqmQnxMO/qo8rZGFeZLh6GMsZNUAPIHPVRNfuW
         6Fvw==
X-Forwarded-Encrypted: i=1; AJvYcCXD8LDEb6mo6a4HQ97jXHUYLcuNyCu5Vs7FQZ3e+E2PGblCzUACNgC6ThUMbgNh5bAMtAsE8dEjDYb7wJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+LymY031d96Sl4CDgi+ZTaXDV1W+ZFAPG6i0/SBCbwBoy3h6
	HDXZJ5wtaNNzMY7NI0GwjBAPUFDgeeN1vf8PZky/wkQIpsHV/cxkHcr1zPmM5aKs3IQ3hkBstQ/
	Vg8UzPBkr07tZNaDop0Y0Y4LBlyBPGL2EHRE3
X-Gm-Gg: ASbGncuIX6zkoUtp+nGytOaAKB3u4lue+6RWNfzbLu/F/IqC0reJtNR9+yen4uNgwlq
	OE33Arunx0BC7eCqARqqKZmyHXDhTW/TTv8Ij0dVIKyJ0B5pFOzrzfzCAE6J5vOAHM392rNXHZx
	J74ftiV7+wulxuYoleQROayWM=
X-Google-Smtp-Source: AGHT+IEmHznl7Ik9Amt2S7g3PVA1k3F+CkuI8zD5o1s+dAxpBVFkkmFeRjysvFVzVsPvmCTyCe22Q+d9Jdu7Cu59sAw=
X-Received: by 2002:a05:6e02:1348:b0:3d0:bd4:e46e with SMTP id
 e9e14a558f8ab-3d03fc63026mr4230185ab.22.1738695737640; Tue, 04 Feb 2025
 11:02:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203230150.106823-1-irogers@google.com> <22469f1ace8127423152c6085f390c80a9faee3c.camel@intel.com>
In-Reply-To: <22469f1ace8127423152c6085f390c80a9faee3c.camel@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Feb 2025 11:02:06 -0800
X-Gm-Features: AWEUYZliUmqeTijL8sAr7rN4aziPfFRWAaOeCitnUkTS0idWPst1Nk1hVcwKDrY
Message-ID: <CAP-5=fW+4AmPj5gfxkPo1Anyqd+NwrRs1HOUwWEdwjBhONA3_Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/23] Intel vendor events and TMA 5.01 metrics
To: "Falcon, Thomas" <thomas.falcon@intel.com>, "Biggers, Caleb" <caleb.biggers@intel.com>, 
	"Taylor, Perry" <perry.taylor@intel.com>
Cc: "Baker, Edward" <edward.baker@intel.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, 
	"mpetlan@redhat.com" <mpetlan@redhat.com>, "Hunter, Adrian" <adrian.hunter@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, 
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "Alt, Samantha" <samantha.alt@intel.com>, 
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "Wang, Weilin" <weilin.wang@intel.com>, 
	"acme@kernel.org" <acme@kernel.org>, "afaerber@suse.de" <afaerber@suse.de>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 10:44=E2=80=AFAM Falcon, Thomas <thomas.falcon@intel=
.com> wrote:
[snip]
> Hi, still seeing some errors in the all metrics test on Alderlake, Kan
> says that TSC is not a core pmu event:

Thanks Thomas,

the tsc event is on the msr PMU and needs special handing in the
conversion of the metrics. We've switched to a new source for the
metrics hence encountering what should be teething problem. I'll add a
fix in v4.

Ian
