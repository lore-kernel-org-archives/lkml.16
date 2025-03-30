Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A703FDDBC;
	Sun, 30 Mar 2025 20:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743367978; cv=none; b=Rc5SJa2naJFk4IBcjdwB6XgUwrq6xRUJXzUR5sPTDClRbckBzQP/Zdx8N0HaCfRSiiJEQYBD2ViLowEKfxJpjpf7FLX1Y3j9ZDFY8dhOwHhsVsX8C0T9hTTkE3rW1ApVCwcghIuQ9uRWHBhd2GxR2T1i3FUQjVxqGQYAWrPBbpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743367978; c=relaxed/simple;
	bh=OwM9rPD6YpijtmxSZwMCDtd2cKv8veMmcdJd5ngOo5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2d9nffcvmL/FZ2MutppFkqg4k9jG9IfPfiDtbhU/JKWITAHcL4p/k7Wc1e91i6uf+DWj1Pu+Ji8EMYV6uo+wTbvqGiHZM3ibAWdohLJvSrWqdNrS1lu5+aeZ0o/q1NGIViB7exRdYq1ec7acFaABshkAgdB8xPqFjplA+Y8yVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=nVSjaXNh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="nVSjaXNh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22409077c06so109178525ad.1;
        Sun, 30 Mar 2025 13:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743367976; x=1743972776; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJwLIFJszXYQ7ADlOOhxydXwlK9mYBVF/IXABoKgtHQ=;
        b=nVSjaXNhP/XzXcWnwJ493Gu9FCqgWdWK5RfqGbZ4kAA9LGcfrwRlLPfIhyVc4hKJEJ
         xCBmyG1T9ZdZ80Y+3WTSVNuJ9hcHFMR4kAFWmskt1PezFLn/3DA8zkPYSw3fjgiAe+K+
         jp1/3Q9FFMVRtMsEFKenf7wAWALzKS8T75erIu5T4gGfMZCWIxFoBpPIbFYlnAOTSAnG
         6J5GqCG0FMKLFKeaTioqAHHp1oNlQU8ogRj1RvsMIytWPUwyGisIGBFaRXUpDArHLVze
         oFjH/O5TPft2piMS99ni2D7pfMq7WyRj5aYFXTuKOxZC4DaIk5pNkXGBzQ3RET0jQGIl
         KSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743367976; x=1743972776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJwLIFJszXYQ7ADlOOhxydXwlK9mYBVF/IXABoKgtHQ=;
        b=gmG4qHMPW3V4dLzAJLP/RCPCX65RKe1WEjZxEKcAD7wHCdMlDhtc3QipSCyk4AVnyK
         TMfMeBX0DFTbpQ5FBUeVpt1uJfM2Kf6h+FxbrsszmEo/AXsgO7oDczK/8BXjlMkefXYl
         CTeWuXczHQvpIEXByqWotS3e8oCcNzd7kNFbrBCKcKal9ujqY1VwYfCd8AzXYmVbOjUk
         1UO3Hz4hRbxG3Itig0St6O8X5bPeGyzVtSEt7XxKyKOS3/FMcq2nV4kK+ZCa/53OdkV1
         Ta0j4XHf2vFB5yiaAiUfUKt83uUAjThpNtKPwdnjWn3Qj40JAsq3UXcDyz1FiHpgc1vb
         m3hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXhGqfgRmGDIbza9X8hfCO39G/A7VXYUj7UG0wH1LGt1etAib0bRRIf2lynNL7WpZtV+FJol0ZUWFaA3jZ@vger.kernel.org, AJvYcCWWGVndALVEJDSHhW/0dcDmDNU5j8P+f+8ZC4+T4WTrZeWctFUNs+EHiD2a4PNOsRgSLPX3IvB5LB4M@vger.kernel.org
X-Gm-Message-State: AOJu0YzaaX+gxrPma0H6tXd3+xNSXnq2sNsOxEGghKymN4SblC1FjLI6
	1DTN1R9WLbMFu4LFqQQO84t/Se46ANKRoaXLfW6YKryRhebFhOocN9y7U33Em/jzr/cJs/xEQuZ
	ZN6l7oDc/x7NvZnoKnc/tGS6iXxg=
X-Gm-Gg: ASbGncueuhiVbY1D01uLOdLlXzWX7ve/wHdvSQ3VWeSP5vI5RL3sT3B+tVndm6WRYb+
	K9SUE5uZqnAXtWaXIkTIdjn1EXhMcvNVc1aFb960JQzXv51LCZuHtENVqlE9kNUHTtMt+sOlQvG
	qkXlQjiWbIbKlANp6fX/8jjIc1cwDgRLExDTs9bO04qt8xwEoUXy6AOZnYWVY=
X-Google-Smtp-Source: AGHT+IGlpG9xeO7YabfvvWdcL4rWdf0vZ+QCfsjk6aFSH+Qe92WIllUZklTnZqtfCCxYvcoObf2vFCcEInm2m2e86xU=
X-Received: by 2002:a17:903:2303:b0:223:5ace:eccf with SMTP id
 d9443c01a7336-22935084a88mr74482475ad.25.1743367975896; Sun, 30 Mar 2025
 13:52:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net> <20250323-fernsehfee-v1-2-2621341cd37a@posteo.net>
In-Reply-To: <20250323-fernsehfee-v1-2-2621341cd37a@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Mar 2025 22:52:44 +0200
X-Gm-Features: AQ5f1JqiXYa2Fy3B0Ec_8DxGmkHROyPsojXcUZGTqJUnNHSoBI9B-XlVAsRTV_U
Message-ID: <CAFBinCAvCvqbv367_rn_Rbvn7p8q5kCLuSE7m+gnxaDo9FvaeQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0 board
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 23, 2025 at 1:38=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> Fernsehfee ("TV fairy") 3.0 is a set-top box with HDMI input and output
> ports. It originally ran Android 4.4 and a Linux 3.10 kernel.
>
>   https://fernsehfee.de/  (German)
>   https://telefairy.com/  (English)
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
