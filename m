Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D7621ABDD;
	Sat, 28 Jun 2025 20:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751142399; cv=none; b=O4MJ9/Kmb+LaRnMeh/iw6mXxDz28+2wNMhxHC06i0k3Q7C3LGfpBNDjMjd8PcXhAoOJxNGA0orAnOocQexTs12xZ+FSwDtXk/fGCFDaV+D8APDDfSKMZ5xqJtGKNu/gRQHA/s6CEOAoXqRd4wTbqwgDkcV+RkGcy5ZjjdUzwwrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751142399; c=relaxed/simple;
	bh=25AkAP+Oxy/7aAa504unS8DpFJq1VXkIFfWL7SNORD0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sCQ+QRb3dtnpEzAwp0Qm0xJdvlb+GdNhZdy/saokScuUdYItChb9C0WQBU2U2ieJssbRP43w1EMsGJK6Afyo0QmOlM/JUODwAesChXTlEicLKsdWVOMwAGnn7qM/HVINzkj7rmxVNRm3/sO8EatWKpum7Jj44tCUVpMnV/rpg0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geOLi+yC; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geOLi+yC"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a442a3a2bfso18243041cf.1;
        Sat, 28 Jun 2025 13:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751142394; x=1751747194; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Wvd8sE0kaDsaHnRfYE1X9dhAsMqTM2j1ls+skCriCc=;
        b=geOLi+yCQ1/FZcZIBMdUBLA+hg3m0fzTZA203mmxmqwsx0Cn6lwK8ZcYlWMChAxlCt
         SgsiYPEv6FnQ1AVLXaQfCAVcksTLCmo12bl60SasJ07xekvjWet8w4zrxJ3LNkI3L1wX
         jFUcHD5UI8hvNEGc8WcCGnVtxMtBmTG61NXVIMkWJ6kDjQF9NlVFRYayH2tzpuIj+2XT
         WWtz8r/UJMkskcn2K4rP2cr8MbJ6T0MXEXNdmp6bl/+wB9SdLTNRZvMKsMuq9R9lHDPe
         Ls4xLhGX6LPHoEdVCY8AHZnX57DtSIdTydePe9yVB8FsWO/kDjInBs4fpgSdF0yn8kg/
         sDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751142394; x=1751747194;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Wvd8sE0kaDsaHnRfYE1X9dhAsMqTM2j1ls+skCriCc=;
        b=iahyQVWy9/K2aNx0Bv6MeMaDyoocH8Ey+vCVTkpHG3cFn7cHFy8NZ3kVCwTSpOGrZ0
         ujMbsjQYtVzfTWOvF5dmIz6zte/EZdcJGMGiF3ZOanNR+EjzxvRJSGojPzPZNZlPHjEG
         55p8TbmUy13pINNYvzYwEpfe72K71e8KfiGuzMMaz0ps4vuSrIcIA3PN7r2ZE9J5s32Y
         ocFGibXdRr6cSOGOCeR4QRdPqpQYVnWhGLj3VC2GQ6PbZorU262cT/MB1qqIz4BPct8W
         nlYIhliBMN/qUdIoywgAgNYD97345HC4gfFCUEEZkjUb/Ys1980Uuc+crvhaHlamUYA2
         Qx2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqtMWHBbSpLOnvjUXQU5Poa0SVXC87HB+jmnnNwdVtZajeZemNFxvICax9VYT44UgjQmELEBV1M4agshE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAodMfAFRiA3F/jJ8mjRdjclrg1ym78oAdqsaQtp9sgWqS3J8J
	rSupVYKu/j6Fxf5i/Tedq1e37GtsRGvHMQnNcHDGbSBiuAiAMcLSGlDPYGo9Wu5+
X-Gm-Gg: ASbGncsVYMe8HT9EcMc1D7COe4g6u+vDJoXpzcHPR3jCF5HE+SpPzbivw8KimYbjFam
	aHrBL5/SDLwoj8yxzbkVpyGK4HTs8rDs+GUlXZ5VfHGe1GWlTUAF9PIB2E7zQmcC3b2DtUbu/K6
	IJWoKJDph/xCiI7BNrEGZPGA3xnLwKLNfNM0ImVFvuCblMbvoSSp+sif63wPGc07eoOB2OwCr7X
	gpoJW6PgNxF/P7uIslYV5nwkyZZ7pO3H86/KhMqB+K7JFdsxlTEZLnUKgPpRPqb/cddo7ig5D3x
	DacLc/j09r4dPEoScmfkTAfkJrHdLnQqr+pQoAzcPuQmZzhdfSio9us=
X-Google-Smtp-Source: AGHT+IEU+sM8dfXKOCDIBrhFENIwAbmzAI0LgQ7Kb8UndNFJC+H3tdGB8EQSW9LLjfXfWQ3AuGFR0w==
X-Received: by 2002:a05:6214:2468:b0:6fa:c5be:dad6 with SMTP id 6a1803df08f44-6ffed7a55fdmr108456996d6.6.1751142394444;
        Sat, 28 Jun 2025 13:26:34 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd773244e8sm41439206d6.121.2025.06.28.13.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 13:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Jun 2025 17:26:30 -0300
Message-Id: <DAYG64BWS8XH.1CGZIOE4GYZD6@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] platform/x86: think-lmi: Fix resource cleanup flaws
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Hans de Goede"
 <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250628-lmi-fix-v1-0-c6eec9aa3ca7@gmail.com>
 <ffee2d20-f2c3-4976-bb64-8d442c7c5d05@app.fastmail.com>
In-Reply-To: <ffee2d20-f2c3-4976-bb64-8d442c7c5d05@app.fastmail.com>

On Sat Jun 28, 2025 at 4:30 PM -03, Mark Pearson wrote:
> Thanks Kurt,
>
> On Sat, Jun 28, 2025, at 2:00 PM, Kurt Borja wrote:
>> Hi all,
>>
>> First patch is a prerequisite in order to avoid NULL pointer
>> dereferences in error paths. Then two fixes follow.
>>
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>> Kurt Borja (3):
>>       platform/x86: think-lmi: Create ksets consecutively
>>       platform/x86: think-lmi: Fix kobject cleanup
>>       platform/x86: think-lmi: Fix sysfs group cleanup
>>
>>  drivers/platform/x86/lenovo/think-lmi.c | 92 ++++++++++++--------------=
-------
>>  1 file changed, 33 insertions(+), 59 deletions(-)
>> ---
>> base-commit: 73f0f2b52c5ea67b3140b23f58d8079d158839c8
>> change-id: 20250628-lmi-fix-98143b10d9fd
>> --=20
>>  ~ Kurt
>
> The patches all look good to me:
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks!

>
> The only caveat is I tried a build and system won't boot. I don't think i=
t's related to your changes, but it means I've not been able to actually te=
st them to confirm all working normally. I'll dig a bit more and figure out=
 what is going on.

Let me know if the problem persists only when the patches are applied.

>
> Mark

PD: After reading the kobject code I realized kobject_del() call is
completely optional. I'll send a v2 without it.


--=20
 ~ Kurt
