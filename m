Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306681D2F53
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738879129; cv=none; b=ELZHLgHfFfuAjl9JKcbc8Kgcop7zBNWr+pbACbIUl8d7r55K7+KU9M9SRm/ZcEJscmet2c9IB1tnEDemnuwJqUiFUgq7K5Zg6GZ1VHnZXohQ20PEOcUU7/ZerVLAQ5usfF6bIoIRGgyHMzhHpRBABkIwJO0b5Tc3HbZpGdL+bGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738879129; c=relaxed/simple;
	bh=PVuzEWiWGdU7/bhxXLzVugnQB2A6Ks+SP/VbQvRNZKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmfAgrqjGvKtvjThf+t2xAmeC7rFbcMmuUflcUgOLHXNddqMTvNlpk14vN2vZ25mtuoBjgh6RKQfuxwH7gZQjmZXAkdDoLB5NJWcdVKtNR0CB1yx/EZL2FCeQIyMoVPhES4wRpFncq22MvtEi6EYeWtsCYikXqEQp0qbiSQUIiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=lgMqS8Fw; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lgMqS8Fw"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f48ebaadfso13784975ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 13:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738879125; x=1739483925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T9pEwEvQtMTht7p8WbC44bsRYNPMffSNDG4Pb5DVy/U=;
        b=lgMqS8FwYX9xWhM9kSZPql3Crx1UAQfys1VbpOJ3051C/p7QGVizCiPRKApgoLkAuR
         G1uHSk8GqayOBHbRg6VSPC5T/Ohvh5WHd+eQCimgke4rn5AytLk1I6IMf1UPVOyxRmBs
         nlz+hqo2I+H0DyWTcV6D4L5cwDE8aoWwp75bgiYDkHwWjbOpDS7Dbl+SnXeedEDRwUjZ
         9z3hq1QkloPVTh0K7qF8ICV8IrpZb8W+bvUCLsmNYUhKjhfGcSqaOIM06t5ZTQOoPRls
         d0ZD7i9Cpyu5kQRbVYyU246pK4CGvPklWVtDh/zqYT48ER/fGaisttKZ9futu9Tkqm8+
         Zq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738879125; x=1739483925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9pEwEvQtMTht7p8WbC44bsRYNPMffSNDG4Pb5DVy/U=;
        b=Ib3eqMEDJ8ydlMXocQaP9TzhqxCYI0/5znlvV9v3H6V8zWNvibrvF/Dbz0kAo5bsWt
         vicxjBkJrqpwwnq3YOJ5lygEZFEWUp9mDfOOvY9f42bYJHN3yMOkejU0lOEtfRTN1d6w
         WhPR7UDHxxrPSGAp9UhQ1AWwKS9z7n6nPzL1TEw226wxqKun8aJeN3G9r1grIf1JUjLx
         ejngIi+0BTxee7VfSN8X5EUlmTDA/abFquRdfi74CDJ4oCIQx/2TQx9rqMEzKRUu761M
         XtBYcRfgLourjPA7kphi9J+onfbJAOD5dw2pyBH4w6YV05TNwI5igpk7m5T6qcvnNcEz
         2sAw==
X-Forwarded-Encrypted: i=1; AJvYcCVwGwgH9U0xwcjACNdhx+hri6pAodKDfP4fHIaibEpr9aN13l+Me7DkCyr+DZX9IwUDSXWB0P/snwT14MY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWFGy7KN0frmeRT6yJrCeMg3XVHjkY/xPOHLuyvikBvO9wlqyO
	CfGtYnlTiYZcwFRqVzKyhwQjWZMHOgQuXLbVH2rWjiNUyJA1gRZmk/sBrHI95yA=
X-Gm-Gg: ASbGncvZ6Z9cCqyzIYrDrMyV+ARsGYCGkKFjtZ/IH9bcvei4ljUnIBFno1/ppk252i2
	E9oOd9OPBcCc+V82rhNyLmSvBMnQt8t3fGAbtADyzdnLwrXvJR6Tpcur70aWztx4JHfmQpsserE
	XIxNA1+Odz3eGm07YRbZ9QwNLSaLta4gKHHpPoeBlf3xYtSiO3muHa4XjTdzLtRyB3+4l40sohq
	045201LErnKdQicWLDsQCnpOtIHT2GSfVi1FYzQJ9uFvbNBLfoobsxHxpfmyrzgHEYQFi/fWdnL
	GtvkPD0hvpJ/8gZIseDwdyqdJw==
X-Google-Smtp-Source: AGHT+IEAeZdlOSa7aDkaxgunF100sJqK9vORD3h4QNYuoNX4V7Q49nJIgyQHGUMHbgK5Pow0L8i/Ig==
X-Received: by 2002:a05:6a00:228d:b0:726:41e:b310 with SMTP id d2e1a72fcca58-7305d48010bmr1263832b3a.12.1738879125283;
        Thu, 06 Feb 2025 13:58:45 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae7c24sm1765047b3a.78.2025.02.06.13.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 13:58:44 -0800 (PST)
Date: Thu, 6 Feb 2025 13:58:42 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Florian Weimer <fweimer@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, jannh@google.com,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-kselftest@vger.kernel.org, linux-api@vger.kernel.org,
	Kees Cook <kees@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH RFT v14 2/8] Documentation: userspace-api: Add shadow
 stack API documentation
Message-ID: <Z6UwksPkdwb5DDcK@debug.ba.rivosinc.com>
References: <20250206-clone3-shadow-stack-v14-0-805b53af73b9@kernel.org>
 <20250206-clone3-shadow-stack-v14-2-805b53af73b9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250206-clone3-shadow-stack-v14-2-805b53af73b9@kernel.org>

On Thu, Feb 06, 2025 at 11:38:04AM +0000, Mark Brown wrote:
>There are a number of architectures with shadow stack features which we are
>presenting to userspace with as consistent an API as we can (though there
>are some architecture specifics). Especially given that there are some
>important considerations for userspace code interacting directly with the
>feature let's provide some documentation covering the common aspects.
>
>Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>Reviewed-by: Kees Cook <kees@kernel.org>
>Tested-by: Kees Cook <kees@kernel.org>
>Acked-by: Shuah Khan <skhan@linuxfoundation.org>
>Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
>Signed-off-by: Mark Brown <broonie@kernel.org>
>---

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

> Documentation/userspace-api/index.rst        |  1 +
> Documentation/userspace-api/shadow_stack.rst | 44 ++++++++++++++++++++++++++++
> 2 files changed, 45 insertions(+)
