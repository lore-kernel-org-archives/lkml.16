Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FD87E107
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743423858; cv=none; b=ZiBlAaTBzBuQeTodwLe8LwONSmo0iKFVeb4h/SX9B/lusfHkskp+kYwFzLtiUJILihgKqETk/CPGaDaLSJqhEBJTKnpn+oPLIUU/UQlPPVdEccq+p78mdLyoBZ8oy3qNbJdexFMY1FXfKhOvHwY5SLCIPwX5OcSVRZQ8xmBkRO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743423858; c=relaxed/simple;
	bh=8V6MZolbBu0RkcT5v7DFgbsZxd1EYVkVQphvjU4J4P0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=MkQoX/5iLbrgfikOIYv5YRjHQ+2hPS0KU8fEUX5aEE+GCbZCFr2Z/LD3E6eM9OygM6sdHRSlhCY4Ykjmje3tyLus9KVP3fjyv+cu6G0vQvJS3gduPMcLrc/ViKrs5coy5XecCqQCPonGfqtkoZLe6b81IgoaBZS29O3qw5FnVss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmoH1vBD; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmoH1vBD"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-226185948ffso85216275ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 05:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743423856; x=1744028656; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PV3YrT1ToPWZYkDmrC9eX8kRa+b45YH2VkISR+Wcp0Y=;
        b=lmoH1vBDnmTyT0McgM/knMtKwcvpIR7lslM7kn5Y6Jd374ddMECXeu/exTjhabfrkn
         O10Aiq0dHM/zGkp1regjVEnRlhR6uEhmh7Qr5D42CX/NwcOWbXghRMA6i7mmC+5ToVVQ
         pJYSZFZRJ7hoMIxO3fV/aM1wCcz07nWsh9Ovv7RQ7PF+0e7An35jMBt7xNp8sILBi+w5
         hMpPJ1gSKjsmJIx+5NMxsiwkXNvwdwEr519umgKWNKguZCkk6jQAf/xGkz7Ka510gl6i
         YmCuDVCzMh7RP1DkcxzAXqmllsioNKdnVej+50al6O8Z6svuH5/qMNVb6W6t8rR+lmMj
         CYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423856; x=1744028656;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PV3YrT1ToPWZYkDmrC9eX8kRa+b45YH2VkISR+Wcp0Y=;
        b=Jnbg2otSuu+/fJghT5A8ljpXzNudYejgHHh4cNtJaj9D8j7pbJeZf6jlv/PoTnJMat
         Jx7GV/SgeaOSLQFR6k5BjSvKtxr6xDIeKGd5i2JHEIvOs5mX1uQdpGAMwJurBplhpL8J
         LOCeTnNttO/nI/UCg3ZEp/3ECqkNpq9LCmnwjA9lsFpyfoju0qiJ0OrKolU41Ki5OpE2
         lqK/7/I71R90RtuSwJ3UK0DgAozeQGzPwTpfOkGrarYq85t2VEOxyZQFq85htgbOsSOh
         0tXJDINaFvcOkSUbJfU8lQRwEnLoCZHx5vJerMZPckhaDbi4Iy5aGRqBWDhK1Lq3ErtB
         R+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNKRqGbXz4sMSajPHlj500kmUKf/wHsIis/m1q2F3obLh2k+MFhi6TnkLz4psnPow9VP9pF9/iqrl7vfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN4uVJYVE8SqZJUMJq73N7mYN0L5ygpv/RLoU1Zs2ef8uaW0qQ
	97TRsvtAiWN4yIt8ShaErGT60uJhJO4NvI+f7bya8EyDjuO9eYOK
X-Gm-Gg: ASbGnctzYCQp/ZGfDU3qBT6rG32MgJnaHCpRFW3ysLJF7mq5tZCSIN2mLyB4cgNmO/U
	eCDV6vJ7SXJIxgT6eAcjwpW9gih3eO15zIbofkwWXESU7DIP+5ErKGBE5IvTwNGnwDbRDpPITeW
	PkMF1N+2S1Xxp+bq/11XY1elWfn5wbIECu31nSqybBmLzLWg6uqb3dFfJa80EMErgtp9MSb2Qco
	rAV/2Rzb2bwiJLbqucKWplmlSCxUuGyZ6n2k6l60sU35Yr+Jmk8+PnuTFqRpnWcSlkpzEeD72/w
	KnMlDnDi6d7Ud0t62iTx7fzk5Ih+ssS16OEAqw==
X-Google-Smtp-Source: AGHT+IEaDUcJDrwjsxu4qOgNJXp0yGw/nEOHDZ3MzLdQ/GLzpYmpg1hRj8ZvOBsmmoKJd2HK9uh8Eg==
X-Received: by 2002:a05:6a20:c70e:b0:1ee:e655:97ea with SMTP id adf61e73a8af0-2009f78cc53mr13848774637.41.1743423856329;
        Mon, 31 Mar 2025 05:24:16 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b6dd5d1sm6324292a12.46.2025.03.31.05.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Mar 2025 09:24:13 -0300
Message-Id: <D8UG6DGW1FKI.HZ5UFH4EVY9R@gmail.com>
Subject: Re: platform/x86: thinkpad_acpi causing kernel oops commit
 38b9ab80db31cf993a8f3ab2baf772083b62ca6f
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jeff Chua" <jeff.chua.linux@gmail.com>, "lkml"
 <linux-kernel@vger.kernel.org>, "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <CAAJw_Zt1cYcg-Fa_rCecwHnWKMi7uO2UGNEhMsxPiQa-pgUMnw@mail.gmail.com>
In-Reply-To: <CAAJw_Zt1cYcg-Fa_rCecwHnWKMi7uO2UGNEhMsxPiQa-pgUMnw@mail.gmail.com>

Hi Jeff,

On Mon Mar 31, 2025 at 4:51 AM -03, Jeff Chua wrote:
> This commit prevents the latest linux git from booting. Only those
> with thinkpad-acpi will see this.
> There's no clean way to revert this. I took the thinkpad_acpi.c from
> vanilla 6.14.0 and that booted up with the latest linux git
> (4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209).

I submitted a fix for this that you can test here:

	https://lore.kernel.org/platform-driver-x86/20250330-thinkpad-fix-v1-1-490=
6b3fe6b74@gmail.com/

Thank you for reporting!

--=20
 ~ Kurt
