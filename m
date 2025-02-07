Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1B21B040E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963617; cv=none; b=FsCw+jtDxEp+HDQH1JBd7CyyxEPp2/aUkHSvh9Qx/ILuvXuHdXRcmPY6XSs1RjBepiNS/Uqh9XTUprVToGSpHBCcqBTudlIA0CAkis857yLoS5lYvzLgpJ4yi64pYncieiFVFMalMVhsc/sU1tcvWdruYVy0CSQASAkuYdGK8j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963617; c=relaxed/simple;
	bh=HVmE+Tt35mu4vWqHOKjrmfxx5g5d6DsZZLA0kmOgFzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9/ywJSnQiHW/7xqTKSgf/uofwNt7bPEYheRnHDbsQPgUeiaH2fpr8qiHcUQf32e2fOOzuUlLNTfVTf74+KxFM7JYNoz4waeL+BmqwWM9K7bngqXMHqPzcO5x0rAw15KAhKRBOHh0KHv67u28SIFqaTXZSIs/OC/1JHPI4+YzN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=2Zi69OuW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2Zi69OuW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21661be2c2dso46901185ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 13:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738963614; x=1739568414; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HVmE+Tt35mu4vWqHOKjrmfxx5g5d6DsZZLA0kmOgFzY=;
        b=2Zi69OuWZX0UEjdLx5h7V2aS2lqQrckk3FDmNx05GHs46itAomz4crC74qdpyA1/aO
         EDpv/V+hCufPH6md+AJjX8dBvJpvI2nXq5QRAdC0FEAplwx4oA/mAL53314IdTNMLaiz
         Z3oEJ0QfQfYoKs4jRCcSc5rMyUaI6eIiATejMY+99z83i77qvglKsPeZwRBla726fYop
         PSTgQ5SiRqNy7P0s2LbWOPPnWkA7jU0SOOkIBgWbTQv/vWC8OPJTplulgmJsq2zsIs0u
         AQ+Zavzfd70CDCuvreBZ9eZ/w0CgBpcS/rskGViakv1aBnSUYnfnrZjwsuraqKhv0PFf
         3wTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963614; x=1739568414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HVmE+Tt35mu4vWqHOKjrmfxx5g5d6DsZZLA0kmOgFzY=;
        b=VQ4N1cwbDiIfj07ekMQtz3pAgPq7AbQGsjQ+/t/W1Zib9a1CERrONXj6Bp2YaPcwNs
         lSpFreoJCDXAwpwRjtek8r3Ue0dlSOvH9SquOfK6LziL74udASn/gSQe6VTuU0XlmZbt
         rsnl0rLtVyOgaHSx13TAIbA5AO+PT3ylAJrzsgSLPhpsHQbgfuPDdWjPP/FKWD+Vjiwy
         lFx7yRb54gAn2DA+M6v3yQCcINWqB2mZJ/A4iYZdZOhLTwf0Nv5Lw27NeELp1bfQkG3e
         x/jNDniVJtZ60a3t6IZuJwOxM4hG3bpO8pW3EvX213Ls8eobOLrheViHr+YeYa5VN3kj
         qX5g==
X-Forwarded-Encrypted: i=1; AJvYcCWbIeXxmRAasP5dPozeEeBFeckAWFxiAb/PkN4IY/pRhTEYn4d6It5nSzpqdsDem6N0nQ0Wg5L7Z0FJVSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZf8332NqfEgOTRYRoIksLSU1yFrKMtprk8xWOTrEOoGBG5Av
	+7oU9ZbQNJ2cB1s6+6AbGKyWqimYjI0Ll6Es3sgoPcUhYPQb8A9nC1HbTUUUjCc=
X-Gm-Gg: ASbGnctS+F4yIcBp5BuB2479AVHH+uCCDv190ydAzt9DJz0SvKBtvskKM2n88UKybUl
	of8m5zJEZTmrmvArtxWlKjeLmwFT12WkQoeSBaSrSN545GP3esbJPOMBmsfQOag8sSEInc4l1jf
	HDhtDeR7W1F1GMA+PvWw1npHcdVyLYbBherLOOYUIFof9bYNjY7c5WBmBVuV0QcbfytzwdDuzBJ
	8QMrtzP6DYCYnQPY31XhFKFWU6Rab59Vsg+szYhpJ2j4YNpeLuZMIThGxYJjzJOFW0vZUM5qrZj
	mb4pjSE7T/+y75irOiA/W9mdxA==
X-Google-Smtp-Source: AGHT+IE9Oev0Y7C5Xmqtwl/B+JiwmKuI48iGekPbKSdtVdA99oMBiZeUkT8jvrSGxyy3gXBYBBsXzA==
X-Received: by 2002:a17:902:d4cc:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-21f6a369009mr6855425ad.12.1738963614537;
        Fri, 07 Feb 2025 13:26:54 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d551sm35131205ad.110.2025.02.07.13.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:26:54 -0800 (PST)
Date: Fri, 7 Feb 2025 13:26:50 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH v9 14/26] riscv/traps: Introduce software check exception
Message-ID: <Z6Z6mhiQ3DmsNZe9@debug.ba.rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-14-b37a49c5205c@rivosinc.com>
 <fec3b7be-4259-4eef-87f9-b2cee5718cae@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fec3b7be-4259-4eef-87f9-b2cee5718cae@rivosinc.com>

Hi Clement,

Thanks for looking at it. Inline
On Thu, Feb 06, 2025 at 02:49:09PM +0100, Clément Léger wrote:
>
>
>On 05/02/2025 02:22, Deepak Gupta wrote:
>> zicfiss / zicfilp introduces a new exception to priv isa `software check
>> exception` with cause code = 18. This patch implements software check
>> exception.
>
>Hey Deepak,
>
>While not directly related to this patch, is the exception 18 delegation
>documented in the SBI doc ? I mean, should we specify that it is always
>delegated when implementing FWFT LANDING_PAD/SHADOW_STACK ?

I don't think it's document in SBI spec anywhere. Should it be ?


In code, opensbi delegates the exception (SW_CHECK)
https://github.com/riscv-software-src/opensbi/commit/110524441a827e026db3547ed03c5723b9c9e211

>
>Thanks,
>
>Clément
>
>>
