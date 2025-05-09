Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7151482F5
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794441; cv=none; b=UH88dfq/9SCvAWMMQUJiB471Y1AzOIuAPrP8jcAJwbNYUQ2wSJpniWFatH719B1g4ZJFRl+MlYIlvzB6LCnaYMzFI1kc656wxeYnsAZthFKCo3mYHadg80bTp45Y7hrLvSSd8fItrzmwyZduJvkQw27i+fzZ8cVcFSdwzuV1eS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794441; c=relaxed/simple;
	bh=+UtFR7vubZW89xp2cp1g2Mh8plnjtSualam5Fk+kOWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USlJUlyDYeukI5QGjpUyhFwPsJk5PPPYYoEJUG0+L0G6WxVqB+5E05HU+6Hltr598qmF9sdptHwxBsd0ksGY8WqGny7HW1Pa9yz6X4pGyDqOjIYlpAAdr3qBSbW4djR2gKlzayfO5CKp3n5bx+0k6y6rUJ60RSE0dyj3bPiNwlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HErkqrQK; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HErkqrQK"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54fc36323c5so1481655e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746794438; x=1747399238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UtFR7vubZW89xp2cp1g2Mh8plnjtSualam5Fk+kOWg=;
        b=HErkqrQKP7FZMBiFA+4j9WWBFxcxkh8MUw9fWEDg4mqJ2mZA2VZXSJWoB5YmiwOA7Z
         N5hM/605MxsGhaISDtMG8hl7Vord3C7rB/ewJCRgr1Zs1XjrJyLPBxaTUFkYTJ1pbt49
         3H5HusgBUCpvD80Bt4j7zddk27RFNCdkAHfXYx/C+5yZ78w+2Di7EIeNknj8ev9w7L9x
         GHZgUP37AfgPds0nC57fXCAc6vSYgHrmbNPFVYTs/AHjkP3lQwk7+ZCj0grOgv8egR37
         5A1R6vVUif4PA5p/Q8SddLfiFjHrw3azQTx3VEA3a8r5mwkC7+6IvotmWS5fiMwRcGkA
         L4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794438; x=1747399238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UtFR7vubZW89xp2cp1g2Mh8plnjtSualam5Fk+kOWg=;
        b=DdxV+bp5NYgYy5aZ/YXWznd09JqSHhlnG2LhkQs+1UTlnEMtasYYO1grsg1S/90hmw
         29DeGWgs7JFm4m2o1T17hJaAJofSt1K39UQE/waUUpKQ1CgaEr+qOoS7C2acXhYcxUbk
         EX+OMMW1qNS5zB8V44Bz+wVw4NGDeiXiDHBMI3CKU3DvM/6ecur2UE+bMqEniyFVqUTh
         E+JEJOP+q6LVqdvxvXgRJM1ScJd5YV2aGTLgH0X2SFHuNAbgn+dnijfDKjfqOdMnf+ce
         i4qXiCCNYFnDnBfXpVrXr6KTcc0hCSkaLRkjlbQigDfcWgT4cwdLNXgtVk1gvSje96G8
         VFYw==
X-Gm-Message-State: AOJu0YwYvuZZ9OKRpBMo/muIusgydbGEYu4wLwK5QuDVO8V+RPLcGTyb
	xJCWqWGOdv9mNtZzSbHVOWMSoJbMJb9gvAwl7YsSwiAJUob7HmMDkfF7vlS6n4bNgbZD9AsrovJ
	TwxokuotbgN/7bDSMkhijXBjVkGNilmImca/k1A==
X-Gm-Gg: ASbGncsf7hQBye7g4KIeCaUnjD0qkTYGQOXDg1NN33aBbC8iTmqcCP7hxAe836W31lN
	nuH33br6pl1HROToHXU4jqOxHFudExuAiB/Z1hAO9tLTXqxxMdNvMfGfAPQtTMnIR8FznkkrkIc
	V5ydRIbTbPmzLm3CMo7OvFtmR+St5oZjdUjx3oQMlkPHntxceW/kMYLw==
X-Google-Smtp-Source: AGHT+IFdaNoxSwXadZPcFSu3s1a5OECzl0nPHiRim09tz00SJAtaxjhMC0Ms7Db/M0w/VxGQVS1tNGzED+Wljh/WZKI=
X-Received: by 2002:a05:6512:695:b0:549:8b4d:bd47 with SMTP id
 2adb3069b0e04-54fbe407821mr2923115e87.9.1746794438053; Fri, 09 May 2025
 05:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508130612.82270-1-markus.burri@mt.com> <20250508130612.82270-5-markus.burri@mt.com>
In-Reply-To: <20250508130612.82270-5-markus.burri@mt.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 9 May 2025 14:40:26 +0200
X-Gm-Features: ATxdqUE7pXlfCMv5H1Kgd5pteF0BctNTVcpk-CgS0AiKblrCPf4IDIEcE-yR17c
Message-ID: <CAMRc=MeYYUc=FKJdArpqv0D2fUt1vyCJiZzjYyN95aMv0-b1WA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] gpio: fix potential out-of-bound write
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
	Maciej Falkowski <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Nuno Sa <nuno.sa@analog.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 3:07=E2=80=AFPM Markus Burri <markus.burri@mt.com> w=
rote:
>
> Check that the input size does not exceed the buffer size.
> If a caller write more characters, count is truncated to the max availabl=
e
> space in "simple_write_to_buffer".
> Write a zero termination afterwards.
>
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> ---

Looks good and does fix an issue that can be easily reproduced with
KASAN enabled. Please fix the issues reported by the build bot and
resend (as a patch separate from the rest of this series). Thanks.

Bartosz
