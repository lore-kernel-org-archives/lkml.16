Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B4223C8B3
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751130307; cv=none; b=X7E5BE187XcPxgJY47i7WcY20owLLwGcqPIi7O8M/KD58YUo31T9D28ZLUHAYOXd8Xrp7LH9+bbovWWZX9KBX73O8elYlZHUpPjxtoGbUBy98ItSFotZSNTMQluuRc/UYP5D1fXiE73kw0ArhYjn69faBd47TzQCuv6dAJAXPEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751130307; c=relaxed/simple;
	bh=+dp6ybXMtlqHhwnP+WfByZrCcE8QMyxosUcvXcXnEX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezbo+x0Rcgagbndpiwa2Y3vGsZdyMq2TbbCh7VBAp19oVSPSMBbl0M/vAuxrTmhjn8n+rYWzatv7Pid9TWPbvMgtPg8xo1Qmo7NobF6PHHOGlJ7n+xrNViwwYRYRxherpC0myIbeTfvhW7OeN2mwOoG419yP+ddCo8RcCyaf2eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QCTFRdAF; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QCTFRdAF"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2efb0b03e40so490281fac.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751130304; x=1751735104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKcbmQtYAI4f7gKXtohOTLyE8Sg7ZI8YjRzXc1wJU5c=;
        b=QCTFRdAFI/KXnSlJEpYsudzJehWk1XtwwoVFg8LAErCtIahjXq7QbvLZC1SIZx+xb8
         uRHLZMlrnZ4MQV6xBymZvvn3JfGKPMRU6CppOFotTpJ54ADT5Zr/xIcDJUDTMwvt7Gas
         0dIE05+VEC1dkXHfuwvqDy9sjrU3dlG8Qdcx0MmtUOS7xllrmRX1iOJXcQgiNlWaIAAD
         yB3pmCPAvxc80hd3Wymj+2QpRXQNejH6EYnjTgvbexlCnT6W6URuEuOpgOj3P258Ww0s
         twsnazLdyilpfzG0WzZsZOWXU8oHwid56+w/vBbEk5oCzh1VjjEGfSWxSr+EH0yDvAZb
         Gpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751130304; x=1751735104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sKcbmQtYAI4f7gKXtohOTLyE8Sg7ZI8YjRzXc1wJU5c=;
        b=WCHO4o04eoXNgMa4/0lCzc47Be4HQg66yZSJWH3YpQbpoS+OkD9++UoXLuvC/N9IwF
         zsqKdAXfTuF9TeqcvmeIW1/WzyuZk6OZ8k03lDd4G0+j1vByzw7fHttbgayQKHvF70dq
         MfE5730iF4tI7SAudAYrbLDBkpDv1df2v47goapUkuWaeWeJ6Uwm9mlfeVv+pCxncgQo
         0VJuYq4f+7RPYt+YNff35U8nkfpGsjrEJdVdb4bh/Uvv8eXK4lBmTihw2IDyo+OX8PGe
         n8JH3IxTDltpEpgUL3TpEuTkWfIPo9jHl04VFnHfIROnal2isofe8stU/HgnHFSe0Qem
         2eHA==
X-Forwarded-Encrypted: i=1; AJvYcCW5zYbrBgwFuPj8ZSidtNAIs9NL8nEsjXGlbNATeyZYEr9oHRoYdUmeNBmyV6BD3Q0EmW5gxCc2gTz8tkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnlV4G8MvajWbAXOdKNY+nQxLbJ1DlCdWi4ngfwohkLob/dIgX
	oi6LPl4x8JfqyW485nxJUp0n7gCMzeGtoQWef7j4kkJAaSeHOjC7DDze9IJHNsLFkwA=
X-Gm-Gg: ASbGncsBBg/anpuMMmQM3TW4nKpr7svN6U1NTYSRCsFPIaU5ZcXrONagc65Qmf+5z/9
	VLxJmIgHS4jLHAFbEpvyL42KbhY6MPl5aUz6ZE/LomxI/xJfc/ocYiDF6nO+TgIF+JX/DS6S3CE
	55BA2/Sq5myvyU5awesmRNkIqBs+ObjuWq9Ee50TcgG7e50o6bLOOKF6D/wu720YFBTEmU8PIEB
	tVeDLTuAGG37Ek05Yb7HsbDN1/p0sAmjwsJFBfExw5AyE0PdaLnDQfwPy+imU3GT0DH0oZYX+/4
	H/jHc/S7TN/SIsiLglXFObjtpgs6Inl5ztSLeFpB540iMwugygKuZKwLnWFMxPA7Y/1bViZ2qT3
	TjdLMzwn+FGYiP5s9nxdyam/C2KhI4oaC9KGx0T75c1dRS3t17A==
X-Google-Smtp-Source: AGHT+IFJ/JVoBiehU76W2KigtYxFPuuqBSmL+XctPUDbXP1ihOU8h3P+Qo40YRnaK40PiWs+aDA4dQ==
X-Received: by 2002:a05:6870:b488:b0:2ea:1e5d:8ad3 with SMTP id 586e51a60fabf-2efed6782cbmr4697161fac.22.1751130304231;
        Sat, 28 Jun 2025 10:05:04 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4? ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50f7d89sm1612370fac.34.2025.06.28.10.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 10:05:03 -0700 (PDT)
Message-ID: <871eafac-f643-410b-b201-681551075a2c@baylibre.com>
Date: Sat, 28 Jun 2025 12:05:03 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: amplifiers: ad8366: make ad8366_info const
To: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250628-iio-const-data-12-v1-1-88029e48a26b@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250628-iio-const-data-12-v1-1-88029e48a26b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/28/25 12:01 PM, David Lechner wrote:
> Add const qualifier to struct ad8366_info ad8366_infos[]. This
> is read-only data so it can be made const.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
> I looked into dropping use of the chip info array in this one, but
> removing it isn't trivial. There are several switch statements that
> are using the chip ID still. So we'll save that for another day.
> ---
>  drivers/iio/amplifiers/ad8366.c | 6 +++---

Replying with the correct subject. I missed updating the prefix
from a copied commit message.

Should be `iio: amplifiers: ad8366:`

>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
