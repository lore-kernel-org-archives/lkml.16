Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBC6292914
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796468; cv=none; b=H70Gc4Zo+jRgC7CWiMpL1AnzGAjcmYJ6tdvdWqEd/oagzWbqGh9RYpxlBXqD8JbPODYB30Pu+9pDI84NnM4oJCuI/AO4VTlyC58hXVP7s7nFaHaug6NExtMDRdhSnCvXwzFmlFi12Kthcr0vaU0BjwBfw1oPkBu4YLPX2TW+OMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796468; c=relaxed/simple;
	bh=KSWxgLBt9iNu+W2gwxOsv3uUQUlLsR80lwPpcYA00IM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0Dy51o/++tQNPpzdd08cP83OX7bx0+N/VQcbexX764oEzvgRqLizVFHluiNhLHQQiVlZ+UZKYKMIxlBbwT03whKKQD0IjJJQXukuW2sPH5UrcOVqJ8/+/QPIQth3UD3CCZUFwHLCg9hl+nTmdV+LKAlyZ8+6dvN5dJvPlD5F2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=DeBl4dBL; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="DeBl4dBL"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c560c55bc1so258992585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1746796464; x=1747401264; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1wuHYvY9TE0ehuOIB/jYes0+Q8eGbfL5Wth0ZjKDdKI=;
        b=DeBl4dBLDGehrYXn/lmZXsd9TBpPWk8cn1PtYnVe8axZj96jNINaj1vKm5QGzUKfXb
         uCivdKToIcMVilB5uGW1ZyOyH2rRy5zr0xEW2CI9aZmhosXBDbc0qnljnt3Ys5w8LX2H
         1q3qsnhC4VA6QFlTpy6BmB7NYDrMqKgPJ8NVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796464; x=1747401264;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wuHYvY9TE0ehuOIB/jYes0+Q8eGbfL5Wth0ZjKDdKI=;
        b=wMzDtK36/lBfvgi0TFFZTbdGFzvC3Dk35OPMrWNg+est5HgsflvFE8womAIRvnw/a0
         7/2DPLeWL0J7HKbtz8URQNCEP4KFCZJLZKOnAX2l3vFGxdiz8cId73w9xf9K14D7ICl7
         2bloUQXWuCAzAUUudrsV+ULshwhnBdELA0zIN+OIBS0cDMV+7qW6xA11lhWykybo2on8
         lIrTYh4Uuj5jNvM4saBdEoyT3zP3aDk80gzF8nLf/CfXHCTI+xe3twuchjBY+KrYyDHv
         Im5PVIEfTS9BEVqYeHNNX8QahBrj8HDjmDwJXiwWtdGRLm9ptWqp+/bN+4yV98y56hIV
         SEyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7eY2Op0VDNdFbtl9reqYetK6HepWhBuVPpUn+5eM9+TBKVbs0E8s+tzCY8wJIGbZokbUu3FUe1pNdiNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXN18FGBhtmlMXrxb2PqDZ+/qlsqG1Zw1Bia0yJD2IKRXpe3cB
	TDHu94EcrgZsWV9QRvyKVC00FOE9psp1jkFAmMbwu+qx1k+v/Snaoto7x8y/8eV7CaaflAihfDg
	9/5Uk9lU7V24ZmBTixrG876Yj8QWqeEVW6omxzg==
X-Gm-Gg: ASbGncu5uvcN7tV3kbp6VvaHRHVTL74jAOGWN6Khp3Q4/AMjMNk+cjS7XdiU5RNk4uT
	TZx4FsSF48R/5Tsbmw9lW2kWvEzEcNCR3Y3yWxG7wEDWN47eqTbehqgn7g/dNPpzINRS8xRqpfp
	o07h5q5pz+lyEj2J8CU7GhQUEW
X-Google-Smtp-Source: AGHT+IEI3puvqThQlqq0KVhrZ5KQwMenEd8/Y1uIX7gEk73Z+TEhqZJWbjf4NkO60KZ1lrGz4/VXQmOvi5r7glYegFY=
X-Received: by 2002:a05:620a:191a:b0:7cc:58e5:17a6 with SMTP id
 af79cd13be357-7cd010f4275mr540946285a.8.1746796463656; Fri, 09 May 2025
 06:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-fusectl-backing-files-v3-0-393761f9b683@uniontech.com> <CAOQ4uxjDwk6NA_UKiJuXfyY=2G33rruu3jr70pthFpBBbSgp1A@mail.gmail.com>
In-Reply-To: <CAOQ4uxjDwk6NA_UKiJuXfyY=2G33rruu3jr70pthFpBBbSgp1A@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 9 May 2025 15:14:12 +0200
X-Gm-Features: ATxdqUHOG_qOnUoa0UNQFUYGPrSWq-neQTRbvMiWLcTxWd52TgDxDOOospnlmVs
Message-ID: <CAJfpegvEYUgEbpATpQx8NqVR33Mv-VK96C+gbTag1CEUeBqvnA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] fuse: Expose more information of fuse backing
 files to userspace
To: Amir Goldstein <amir73il@gmail.com>
Cc: chenlinxuan@uniontech.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bernd Schubert <bernd.schubert@fastmail.fm>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 09:36, Amir Goldstein <amir73il@gmail.com> wrote:

> This is not the case with displaying conn, because lsof is not designed
> to list fuse conn.
>
> Is there a way for userspace to get from conn to fuse server pid?

Define "server pid".

One such definition would be

 "A fuse server is a process that has an open file descriptor
referring to a /dev/fuse instance."

This definition allows a mapping between tasks and fuse connections to
be established.  Note that this is not a 1:1 mapping.  Multiple
processes could have the same fuse fd (or a clone) open and one
process could have multiple different connections associated with it.

This might be sufficient for lsof if it can find out the connection
number from the fd.  E.g. adding "fuse_connection: N" to fdinfo would
work, I think.

Thanks,
Miklos
