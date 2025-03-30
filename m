Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94011991CD
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743358549; cv=none; b=mdh4UWlPtXImOe79oHcIJHfYNtjjoFA9p4aa8Ih4v5p6dkely4+1LAu7xIvKb54EKmPBY5yQmbgHJdO1n95ht/CCSuW2VYmN3Hwtxd632Fggdd7LWxaq/0zCCo18rH1WH1iES8q0MiC4RdRMpmklR15zjD6EFipxQN9MbsUnw6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743358549; c=relaxed/simple;
	bh=4sZwfu4I6ayOwUNpO+OVxZdSXntB6KxMsWX3rRjNSgM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AJSg81XjZayNL8+FMA+F7VyEwLIPSdzG5055uqFgX71wAuG//Pm7aWdik8liBYuWTekoxswfyp+jwoGDZqithsS7iTgwo7yiR4vj4pywNsioK8usXL8aEjCHpbuvdTm8VM6PmdjkoVlLrXzZmO71TdMaxfFZ2YgC9yK0gNuq8Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8YFFY7e; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8YFFY7e"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso28401455e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 11:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743358546; x=1743963346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGPTlPI6EoCs9ej618bYWCVkZWkN/TFd5wVJ5HmjQCk=;
        b=O8YFFY7eBS5bDdmpU4QX9KZFEV7fNvLazFJYyZqLoVd3vh36vrvSWI9NliILoDc9ar
         RllKWx+BDNqE4iq1m3gHMjhS4nPD36uj76gbuHcOy+LPK9XDF7YgPaZdOFHNkl/ON1jA
         rPG3tUH/ANsT2jza1SZ3aV8S7iqTh813S2gYqz71Sud+et0rWa3iDJKsK2jMz8ZeOfEj
         QgSPbOvENMknFFUHVLb0GPnK1zbbbO5e3jMp3+T2wm37rXzcEauv58SytGQaDnzVjCbu
         QTksfW4iJkG9Sj4/JqSTj5S59c3FqAluEL3Y5rVl6Iol5qulNZT7uTni7jx9duetkzzo
         nViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743358546; x=1743963346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGPTlPI6EoCs9ej618bYWCVkZWkN/TFd5wVJ5HmjQCk=;
        b=rSn/Dx75JpqZR8aDJyxYwQ9Y1yAdzzqBupKXcwiFGE/mM6GoeLxmQYtmK1Z04whDMI
         y0qNq645fV+T3n4kUsCUQ1hw3qsrRb8dNvW1Gn0iERNPR2a1d8eR90eia5SEct3W7LJg
         nXdIW/iBolKwDqKayd/ou3QKyoFITUuodycrmMWNWMAjE3iBllY5lW4oPiyamRl9chJJ
         ORqHwddfBt6gz6l/kLNna5xVh59l1kfFAdZFrppK0rnSQITFRKSulc+iVbDH++oHv026
         T8kjDabk+5rTDe/Pvnp9R75drDiHFEZ96VereDDYC4hXD4eBBwO8zNlf/9ifBpby3KJT
         RRRg==
X-Forwarded-Encrypted: i=1; AJvYcCWR9zKkl8xq7IDbmEwGwQNw2192rpbVUcxXWwWEBmUiv/zjhurXBipdYpsrYuBZr1PSoy0sa+X0C/8S82I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQfAjhheBgZ/GQhy4S/E6ExP4iKRWKdZngapICmKt0Fhuo7v6Y
	/Vdxwl6QhwQNzCeEr1cAshFRtreLsXx4JBMIH2Xz3gSeF1dQ854krqC2WA==
X-Gm-Gg: ASbGncvUerugK+AuxRSQPMYkdhE9sjz77YlubacJZqzotvwynAdu3Vv66zIx1pLrA6B
	efNEu0WA2ZsvPuej9qyxvfEvy/wZLl9GHQqTJnEZQcOt8fBgYZiL4Kv0gKBdPj8ChTXH/0M0G1J
	aH3pG68tzuVv0iAvu4BrXGcK0iYdqL5Q1ULdthrzn0+4NXzyLyG53QvKEWW4Bhsq3hxmJn/zpUs
	TAWnytyZKNLRWyCiY0gVJEb0fBr6PkzB3dhN+UZBnD91i60/rXPpFm09p4UuJiXpISTxznRRlbf
	8CLJnq/TOvS9MOSEn6hL/wz4nOnd+//a2Bty/2egQaKrM3CcYBLpkDQhFoYMOhDnLex+R1jP804
	uAd+SLA4=
X-Google-Smtp-Source: AGHT+IHKutDWcij1+8hXVhEYDptNE1EAxvJre2cQU85sgXqRJCgBabEnLTZyF0v+mrQo2OCLAxhwEw==
X-Received: by 2002:a5d:64e7:0:b0:39c:11c0:eb95 with SMTP id ffacd0b85a97d-39c120de38bmr4531552f8f.17.1743358545909;
        Sun, 30 Mar 2025 11:15:45 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc12bbsm97991905e9.13.2025.03.30.11.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 11:15:45 -0700 (PDT)
Date: Sun, 30 Mar 2025 19:15:44 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
Message-ID: <20250330191544.213e07d8@pumpkin>
In-Reply-To: <CAFULd4a2eOhZ4TPQRsLtN1yPYSfgqsXR_yOG+z3PedE-ZCMynw@mail.gmail.com>
References: <20250325164854.199420-1-ubizjak@gmail.com>
	<20250325164854.199420-2-ubizjak@gmail.com>
	<Z-Mme_OxuhYfxgzO@gmail.com>
	<CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com>
	<Z-kVT4ROZJXx6kui@gmail.com>
	<CAFULd4a2eOhZ4TPQRsLtN1yPYSfgqsXR_yOG+z3PedE-ZCMynw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Mar 2025 18:07:30 +0200
Uros Bizjak <ubizjak@gmail.com> wrote:

...
> The kernel is currently compiled with -mno-red-zone, gcc-15 introduces
> special "redzone" clobber to disable red-zone in the function that
> includes asm() when/if the kernel starts using redzone.

I really don't understand the point of a stack 'red-zone'.
In any function that contains memory writes the cost of a
'sub $n,%rsp' at the top and corresponding add at the bottom
is surely noise.

	David.
