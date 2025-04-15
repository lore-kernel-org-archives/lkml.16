Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B69148FE6;
	Tue, 15 Apr 2025 15:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744730291; cv=none; b=IQ0xwdk2zQNe3kAhtWGQjpXNn9GOCDvWNI7b5i4mRKgc1Q5AzeHcsQ4h/xWQQQnEILPNKy40Oj+V61Z4y3i/EH2nn1ScJH685AVq2QaofkJbvBf/Id3W8rtx/GRY2XgOQntnJg920M2TwejRWiY36H0/2hMqzZ+wf4qRrGWOSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744730291; c=relaxed/simple;
	bh=qehmhwwNrGQ+HyIxMkgGTQGUuBUtxetxsKslqhmsroU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f59U96usPSBivixBEjrtX4ganGZXCe409EWEp+dyP2WNTvSrycjaoqd3QFIe2Vbd4NEn3y8ThyEURmgoIc56p72UzsPjc3DHs6O4rlq9oRxCvPCDFN3Xyg6Z2tADqkkWzAFhK7xh+LVz74onMiFbfj9aJUwA8o6t056Si0xQmRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDyMx45B; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDyMx45B"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2240b4de10eso10332275ad.1;
        Tue, 15 Apr 2025 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744730289; x=1745335089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qehmhwwNrGQ+HyIxMkgGTQGUuBUtxetxsKslqhmsroU=;
        b=iDyMx45BEOJbZKiUd2+oGDg4r0qR5qfuJzYR1fEGzw8c8DSxcUZlGdCiOTqglZgG7k
         jBY9Sml06Pf+xBMfy7aiKQxYQT/eStMgl4RDxALE0NxSLRvZShiA5plH+igV2OMcviO4
         7TCL95DFlc6f4hJXHxRsyLJixlmK/nIydJwY4w5Dm39Cq56EjiR+RScKkUx0nzAV/wXh
         myAt60CyYNN1UB3pz9qrCVbZe1mX+Xp/pBb0DdEqSkzOyRUATyEnBPHiTVh2hD8jFLON
         G0II3aYFUByBXtMw704E3L53pGGzG7VyQslCv5HAzegn2DyAmnfxVpIV+iP6ol1ISA4p
         qyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744730289; x=1745335089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qehmhwwNrGQ+HyIxMkgGTQGUuBUtxetxsKslqhmsroU=;
        b=ff0YbR277wdH+Ih1T+AsZ2LA/T5ci7h9cWv+1gzuw1MYP5jPzx29nDQXip3UbaFHyy
         tJkZKk6gi83AjUwp2itGmdqKE+WeR2c+c+sdMU/5Y1lPVJnTR+rwN9XAYtNCswXGR/RY
         zfQV7ShWPUSqMlmWDPB3lmvmfTA+cqBoJadVkNoGS+kftLpudLxxC+NI0c2omIgGpQI3
         TfzL45JutaevNbQsF8XecWmqDpDT1ZwAVwtKwqevtI5/H3f9JU930AqHSAxqR5xqVAmY
         Vi1P8mhVwHj98JNBZN5Va6ghNdXaROYSPilqFt3MZ78i2bXT74yz8qG6N2hoCi6HKIme
         Ajsg==
X-Forwarded-Encrypted: i=1; AJvYcCV1ioxR6DRQE+/sIOolxiAsJqhzHK7qfVIXxxee/kzJKXs5sPtF/nhTlEYNfa/YOC13wDMOcFMyITUBUrE=@vger.kernel.org, AJvYcCVM2d5soCGHzUUaeyze9ZDJ+rAJM53zxebrT9lwBMLhYN1QqHxCjVX0FOSn/iF4svKfor4vpoqIUzwVLs63gV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwtrXiSu/CCza5X34GZhygInvzfB1INun+5Qw5Vx+I44CSPzbg
	Em6rXVYfHvQ3WaVBc8zwe0fOZd8GHq4Y8xVCg9HtQiageeZU3gTo0sNPChNyAqlzohTp/SY1MW/
	7HxvknvL3ts7UqUtDCLuQ/hdy0Ds=
X-Gm-Gg: ASbGncuOyjdWnjUUEdZoONGKcwLtHTvTObUrR1HT+ZEcFaaTQmsh4eLpPop3ji8k6/y
	i33NLu83PScMV5JJ6xD08je2n0gla9Jrz6jE/nR/SNOIA0Qo0YXVreYhZ9KmJvWZXi7ONcrG1ZW
	D4kEIrv1QMk8UqeHHwh5JO2g==
X-Google-Smtp-Source: AGHT+IEHeMo/joK7pGh3tWT75d/VxTzSSwE/yVc1lJE9aZmTNKXHXQayJMaK88ctlg3+JsdJDfj+WLfpHEeoXtsYIDU=
X-Received: by 2002:a17:902:ef02:b0:215:435d:b41a with SMTP id
 d9443c01a7336-22bea49d0abmr86657545ad.1.1744730288935; Tue, 15 Apr 2025
 08:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414131934.28418-1-dakr@kernel.org> <20250414131934.28418-2-dakr@kernel.org>
 <Z_5KHVHh-Zs9HSlq@google.com> <Z_5UjWZIkPxTv1G0@cassiopeiae>
In-Reply-To: <Z_5UjWZIkPxTv1G0@cassiopeiae>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Apr 2025 17:17:56 +0200
X-Gm-Features: ATxdqUGazTzfRT72LCmMNUIGnZQNT1S9YLlN1ZRwlb5Cl0BYQEmihY3ymbcW6Eg
Message-ID: <CANiq72mHkdUhk+64NYVO3BvTbaPPsXAC7uAjyEr06LSxZooehw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] rust: types: add `Opaque::zeroed`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, ojeda@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, david.m.ertman@intel.com, ira.weiny@intel.com, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	tmgross@umich.edu, airlied@gmail.com, acourbot@nvidia.com, 
	jhubbard@nvidia.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 2:44=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> @Miguel: Can I get an ACK for taking this one through the nova tree?

Sure, please go ahead.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
