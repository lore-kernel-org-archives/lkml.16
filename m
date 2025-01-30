Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388011487D5
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 05:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738215387; cv=none; b=Wvzs0fJRxU2A9pnH6gElRd2JDkWMEPMQGzfQOgdPEwmmGKnbVntLN6XIi+OwDcnNt7Go2tSWv6w2x9sYxqXu88yO25wG6RriqUCzg4/zCPKWcIciF8OzPc7K4IsjVlQmRy/4lw4WaXnW64AKzi7EhbQoLDzG4ly1kw9dTDTFnDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738215387; c=relaxed/simple;
	bh=1xTxT7nUEIxCVrTlcmiwYeUPhc+yvExv6p307nMZzgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSdOpnix7V8y6/JwhIS4yhxlZhjkc3tufYBNk34J/TfwmnhvuTjYsUeBXgiAKB0EtwFhj8YAt/3Ovj8NVV7Q+QfroTmmLIPxkrtSK0VLbfLx3yuYCU+ZAcOfZSpcp0DuoNZcmoN4xEnC4gC6lcQelEz9QzS9rVhEBa0tc68W7r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=ENqtLE8I; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="ENqtLE8I"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab2e308a99bso64687866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 21:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1738215383; x=1738820183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xTxT7nUEIxCVrTlcmiwYeUPhc+yvExv6p307nMZzgI=;
        b=ENqtLE8IApL5uqn45MoLvhZNnEtsCWR2NBbbANDJvjQGZ9UswaXykJU/62x2jani9V
         HgTXZYcaVk+RrikbFSnaT8O+g49KpmZ4isKsq7j50bvP+aoxqfLCimfQp3pIyIVOvWVV
         7eBX0IKx2APUPvgvQvPpGoj/pYlfqsE1BNqpbtiumr8W2O+6p1BbA3c7wEBpP4oWLyZi
         GtxsQBZpnFH6HAQAWpVQA+OkkIHXXF1HAuQaPB+4RyRvqQjtgNeK49EvQpUVu9Yvbs7b
         G3Q8xSwVcBTDhQrpYkUYMfHD5luG0On9E2WRJd2v4HXqdPUh5lQLBxnDbsY9rrQ5Eb11
         B2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738215383; x=1738820183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xTxT7nUEIxCVrTlcmiwYeUPhc+yvExv6p307nMZzgI=;
        b=JvaC1Pd3PCgvCM0AJV7NvjdC9u3PH8x3FHYMImxyWgHAqWSX8FTzvg1FlT6C2a4Wt1
         FG99a0GurgnnmHdKAZ7OcSNLTZjtJYq69NDhoVeWrcp5fn67prm1HB0GqoLTKCTX7xed
         qz/VK7ndKLHRynZFSFnjuZ4ACF7wdjUuPcg9WWxFhhTlvHNWg/o06OFSxuHPq9I0SZT3
         DmU7OCHKf0mNj6pQOJuQKSxw1fgRCyKLliFZUzvIH/PC+hO3GDOeyTHDGy14jsMP8GRa
         eLJEw2INzK+xZn6SQ1WX2aiDIn7l3hMzultQDy1kLKKgCd810m3HG27onDeU7OZOMnla
         6X6A==
X-Forwarded-Encrypted: i=1; AJvYcCVK+2H9DZVqZmnb8gCl+iFB63iz1p2Ndjz9ehfAGmuFcuy0q0kxvJRB/FR2lLZ6JtsxROL3rEiWd/o/yqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/S+6eMSL+owlRrDdISxEfeX7o/p/urWDdoQTKmt27l+qK33Bs
	nkyPoImbupCtm/Q70ZWmP1s1o7AD9qwoVNZpKv7NZdo0tNdS/SbtQVRDhZQAmZuSnfwIfRz4nAE
	/2gopyVL7t0CjvMXPqMqEwJRE+2kMcTfM5abM6szeH/ETioMDp3M=
X-Gm-Gg: ASbGnctbCrShbxDb1eWbIhU6Fe0Jf0bKDJsp4txbuNu81wrvVjiB1eWHnzw8bItQDf0
	n8YgWroOw2MKZUd1B90dQ8UD9a07Z6cI5CBetk6rIWoczgZaNwPW8GOJ7Ezz6KYwrS9K5E1DhcY
	uuV9/pdFkJXh6Tk6M7jnga1/ZQVw==
X-Google-Smtp-Source: AGHT+IFTcRDxyjeIL7TMQ2abh3dRBE51uKAm7+BpaUm/hXSSx0Cx1xieccfc4AS5DG07NNp6kfdSRCMkyPBWCqxX+j4=
X-Received: by 2002:a17:907:2d23:b0:ab6:8c29:57d7 with SMTP id
 a640c23a62f3a-ab6e0ccc0d0mr138750666b.27.1738215383553; Wed, 29 Jan 2025
 21:36:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128133927.3989681-1-max.kellermann@ionos.com>
 <20250128133927.3989681-5-max.kellermann@ionos.com> <856ed55d-b07b-499c-b340-2efa70c73f7a@gmail.com>
 <CAKPOu+-Mfx9q79nin7tGi1Rr4qGGY=y-2OhuP80U=7EtRpfBdg@mail.gmail.com> <19750632-1f9d-4075-ac5c-f44fab3690a6@gmail.com>
In-Reply-To: <19750632-1f9d-4075-ac5c-f44fab3690a6@gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Thu, 30 Jan 2025 06:36:12 +0100
X-Gm-Features: AWEUYZmzk3Zthvn5UCDK9Xy4WQiz5Fcury-2hvYI_R5rgcJ9y-3vqehzkGcdTzg
Message-ID: <CAKPOu+8_Tivtyh0oj7UEuWPmdw-P96k3qRLvte1F1C9XivjS7A@mail.gmail.com>
Subject: Re: [PATCH 4/8] io_uring/io-wq: cache work->flags in variable
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: axboe@kernel.dk, io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 12:41=E2=80=AFAM Pavel Begunkov <asml.silence@gmail=
.com> wrote:
> Ok, then it's an architectural problem and needs more serious
> reengineering, e.g. of how work items are stored and grabbed

Rough unpolished idea: I was thinking about having multiple work
lists, each with its own spinlock (separate cache line), and each
io-wq thread only uses one of them, while the submitter round-robins
through the lists.
