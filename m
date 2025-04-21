Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9AC14F98
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 05:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745215092; cv=none; b=Han/r3xFR1ZQhf9voGkb/iqG79xJlrMB2FybBvMKkcXfun1UEkGobXQjMHpWpX0k97vnNWHTX3ew7ua4i5TFUaVTe/MdCx/HhRvwxRXQo9zacuq/wGnW5lXQdiwpOPCWhY4ZCbaGa6uqJy2eNLjN5jYguo1nOzZKltLddO+cyGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745215092; c=relaxed/simple;
	bh=0oE9OFzMBm6elx/Vv+nqc+vDAozrn/qUS97uTf+6q6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIUT43t7G8ORIxBe6NY0HA9GwjvgF+DN/UcxzvceW/uSGG1+hY4BpgrWJRCLKVDphVVgNiXeGLvSigd6gNpl1yp+nYQQVt2sfKaPkL/41pPLjbTf8SA7jf/jkQ86KHhGZvNct8IT60fQ9hriIBDuIaj9MKmSY6kfuVuQqF2VMEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MKDoXdIs; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKDoXdIs"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2295d78b433so41288695ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 22:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745215091; x=1745819891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lLmdl7omBx5GUZwRrka7MxtVvlDhA5e/J1YjqrIrVUg=;
        b=MKDoXdIsQ1VB6ETQu/bPkabWkgNWJ6Ume9P/jhVUNbsigmRkzTDMje+Pz/qUnBjXcD
         ETt4lxINFb7g0/i7Ym3h/3/FCfwIdwRyw/eWPphqmxzPZ7qdTDEHIlpACXWez1LhOxXr
         ITMPNsK0wIrj+pVgiJHFnYS4CBeUWtXx+032nHqKbvQNnM6M43Jer74S92pSTTv4j97u
         nEpl/Yo93aaHFZ8YsEvM9v9d0q/pO8a7WAPiIDrgAr9aHyjQTfnVA4KhSz4f0EIl/fJ4
         8tCK9yNf5l6A80bQaO6gLUfIksfiNHEt+rOyrCTJLMuGJSjQr2QZcC9px/id9cdfqp42
         eZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745215091; x=1745819891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLmdl7omBx5GUZwRrka7MxtVvlDhA5e/J1YjqrIrVUg=;
        b=ZFLMSbHrWKO6nB8+jRZP+cFJ82dia29aIs9/KPeuxCw2rqGR0NOxtAPFuk2xrk8qgt
         TZvl1UGC25hlOGYAS7DSDzoPe6KO8chm+bzkD4BH/aWQ0GBP2HXfKYI4mQ5zKha3/+hB
         rarEBiHOT3dpRmIJX5ARRExT5TS8d/Dshz98XZVglAv/Em1BV35z+ZpO7QtX4IZ5Suaq
         S/CLTA/S9G1sukQraJ9SCNSbfNqgIPuTKh6dLYkekV3CW4ctUMx2ZgB2S5lPNeMXSFaz
         z254O8/Rov3Gl9g+W9beZpz6YcBoht5KHha9kEmpRpYPdY/9K+llbWIk1p08MZaODpVG
         XD2A==
X-Forwarded-Encrypted: i=1; AJvYcCXC/lg/wiQAiZwuNsiT4AKYZDb6cNzpg8W/6Q08BmCNBTVSOQ81GlDcBNsjGDOjyuDlAe+J4dRNYn0MPss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6wp5WE7Q0lOh4/SDpf22cWwMjmee8ulj/R9fFlaaGlIbEs4om
	O+8yREMwpgLBApohjzV/ZJOCdwoP0SGHC48SReSUQlLNuUZuSEq3CeRyCMmIaLA=
X-Gm-Gg: ASbGncsXsIPDxes3PNvmxyeWVByycV7VqTHxOiFj6Ny9mOq/FWN9n3rtNh5YRI+3FTZ
	aaxDAkP6zJDWYVxH6e8nraXiTI4VhN0tjaY8vO8f1lv3L2Fjx77XPwEDYVa6GVKFoicb6YHS7Z/
	SaotkdZAqx227PoXVNI9sdmsBA9OJeWXSrAKvWQPLoIT0wxOHEXHHyoGtBBk13vrjc2xeEQsTs7
	AsYT0uDhGjanLkE+WHcKwPsF2ZokoRJy7m3UEPMCdVCITbGZ8ztFyYkHSYfG/vvH6JFj7lx+cv0
	Ia6G+7ePIBosviAJQ/cphkxvkWYQ7dHShVkyTBIgqQ==
X-Google-Smtp-Source: AGHT+IEY2InDe48NWBZXkKiVwylBh/Sebrc/gEQikw0+OigWJcxwoh1jfGHofwTjCk/KfkXpgp7nXg==
X-Received: by 2002:a17:903:fad:b0:224:c47:cb7 with SMTP id d9443c01a7336-22c530b581fmr160942705ad.0.1745215090770;
        Sun, 20 Apr 2025 22:58:10 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fdbc9dsm57311465ad.227.2025.04.20.22.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:58:10 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:28:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] cpufreq: tegra124: Allow building as a module
Message-ID: <20250421055808.ol4bu3vsdphv4pvs@vireshk-i7>
References: <20250420-tegra124-cpufreq-v1-0-0a47fe126091@gmail.com>
 <20250420-tegra124-cpufreq-v1-2-0a47fe126091@gmail.com>
 <20250421054555.oavale3xjqlrc236@vireshk-i7>
 <CALHNRZ-1XfbN8nOt33Ktsq9z2cjGL8AiWKEZwigXO6OYd64fFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALHNRZ-1XfbN8nOt33Ktsq9z2cjGL8AiWKEZwigXO6OYd64fFw@mail.gmail.com>

On 21-04-25, 00:52, Aaron Kling wrote:
> lsmod lists the module as "[permanent]" and if I try to rmmod the
> module, the command throws 'device or resource busy'.

Ahh, I thought kernel will give error on double insertion instead. But
it looks like we keep some sort of refcount for the devices registered
by the driver and don't let it unload.

Anyway, if you want it to be a module, then it must unload as well I
guess.

You need to do the reverse of tegra_cpufreq_init() from module_exit to
get it working I guess.

-- 
viresh
