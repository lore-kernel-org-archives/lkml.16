Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED5C19EEC2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 21:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749503960; cv=none; b=ENv/SIbEEKQdYwzO1bANhgFEawIbtf4VETqwPXmluDTL6eMf6bBZsyQkuhtSNq8BmDbI8l90Yb2GyA/hwLis2vfz9XjZTm2yKU6IskV9QU+qi91tNEvubWNfV7b9PYr7DLrK/vjuKp3idV7KzlncKAhR/L3hr5NYwWpxKKoQ7XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749503960; c=relaxed/simple;
	bh=KGDhORw1Sk0aFzbe0MQkbln6Vxa92rWD6jne2Jwg/JI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QGvzEtgFqJNgombzEdVbsNCfVf0z7XRZeig/tr4utRJ3t/8TxPyf9o7ccoGdA/Rbs/dHCUvkY+YH758W1qDJOvf9QcVPcEN3wuXnWXIM3t3gfE3jvA0X4AZuKxDj/hMkPTGwjNk3QHuE2i8zouBXhfF5MEVqF6JDHikCydLY3no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYbcu0YY; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYbcu0YY"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1868736f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 14:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749503956; x=1750108756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsxXWARtyGqxL06eG4Mi6Q0uTwGfYn0U8UG8GsvPuag=;
        b=kYbcu0YYPDlQjECz4pgF8fzMFfBU5wY+C6R+eYbN+fM70lBbBQq/cBfvhWDWIdijlG
         RZmy2lWodsNHSQq0lAT27KbmJpn+JfPZoLqhLult3eRUEfEblwX65rUfvp9Nt2DoMECU
         OHn/EpsqIpVhY8QLDwG98xahdgpLm90tsG38zJ7mdrFfEL2uvpONXknGVlFHbXDtuTuP
         mKt7e/6JpxqZnpcbXZqRuZDtZ9zQRU8ycHJmqSiNc6fwKxiqsngmLJNNsqGA9asbJm5A
         QOunthh18RUIvOiscpDx058oE9U70q+fUCfSOqzpopoxemaB9YScssoq+utIzyABbW9d
         MTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749503956; x=1750108756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsxXWARtyGqxL06eG4Mi6Q0uTwGfYn0U8UG8GsvPuag=;
        b=AJaGE2enbbKIlE/DpTfk4CuunpgkktqUCSrdesjIJicip07iS4l5tcb7zY2uKuBafd
         5sZWxKzVeAa84uUtnXQFZrls1dxOy/8EtN+GSJcu7lDEBaFjSooaZePouZEDki3n/tfF
         Udx9JmTmrDaEm50gFIdNKGaMbhM1vFaiTP6I4o6QfYOpLHh8KJAIut/bXJ4xsg90NGOZ
         EdBxt1x+NNsBCj2rl1+iRTQPTD7rQ+CfhUQ/srG+L1OYOPzD4U6+uUV/kMe2atobe3K9
         iAz8F5EwP7vL9Z+aIgAYtB7oxDFUnaPAL+Ur2VKMQlEFqtLbhBklu/LZWxLEe8q8vwIk
         YZCA==
X-Forwarded-Encrypted: i=1; AJvYcCWKCCjtZiEiNrzTJ1Rs4LfOmiu5bXrEiFwx+7+t4jj1fRgH7kFTcsBh9lIn6EIajOB5YLSlrXt6mifBJwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHslfU/4tibAokaBqBuiwv8kCAbM2DC5yFMiP6znuXbFj94bLC
	Y4hO0rIhEG0e5Fkj5GTtlwQQ58Q80PdWps1Z63HOtId0e5rIJwLueF2b
X-Gm-Gg: ASbGncuRB5pmblhmOcLoHji80Toh8ae3qBc2oCRKu8i0Mt1Hbu6hkAALQBbgYXsnXAz
	OSuRczFNfGUhbv6hGKkhaE9urVST3Ua+YHoXqizkyPSUPwhBj2e5qW0yDX+StzHuuNd81MSD+KY
	YMqeorwkNd/3KC+b9dWc7xTVCzE8iqzRH0xjlSca6uXpPh9MdzGEGg3AdNyDNNlQ8Lb+Du+Myys
	HdTsknrDZoGnpoYQltMpmlvhM8N+mcUphL11lEDloDhsaoA/d9DhgLtwLHyT0MTBCjOYjILzQNX
	twe/7Jix+JbRuFgQg4iMlMFpPam74d5IYDOmTo5ahx7jVcRV1es/YSmwVenegKvukZ2D9t2ZOJn
	jUtRxMkDVx2VCTePULS+71X4t
X-Google-Smtp-Source: AGHT+IEi72tx4vc4WYWCw5i85b/P4JuxF0ystxdIrnPVdrl42Pcl5nsPEQmugb9/JOpm4IHdkGjATQ==
X-Received: by 2002:a05:6000:2203:b0:3a3:7593:818b with SMTP id ffacd0b85a97d-3a552272cccmr147246f8f.21.1749503956099;
        Mon, 09 Jun 2025 14:19:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce1afasm122386435e9.10.2025.06.09.14.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 14:19:15 -0700 (PDT)
Date: Mon, 9 Jun 2025 22:19:14 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: torvalds@linux-foundation.org, mingo@redhat.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
Message-ID: <20250609221914.38ad6738@pumpkin>
In-Reply-To: <20250605164733.737543-1-mjguzik@gmail.com>
References: <20250605164733.737543-1-mjguzik@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Jun 2025 18:47:33 +0200
Mateusz Guzik <mjguzik@gmail.com> wrote:

> gcc is over eager to use rep movsq/stosq (starts above 40 bytes), which
> comes with a significant penalty on CPUs without the respective fast
> short ops bits (FSRM/FSRS).
> 
> Another point is that even uarchs with FSRM don't necessarily have FSRS (Ice
> Lake and Sapphire Rapids don't).
> 
> More importantly, rep movsq is not fast even if FSRM is present.

Which architecture is that?
I got exactly the same timings for 'rep movsb' and 'rep movsq' when
I did some tests on Intel cpu going back to Ivy bridge.

I do need to redo them though, I've worked out how to time them
without using mfence/lfence and that should give a reasonable
estimation of the setup cost.
(I can measure the data-dependency of a single divide...)

	David
