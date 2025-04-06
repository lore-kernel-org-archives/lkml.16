Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6232F42A83;
	Sun,  6 Apr 2025 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743940554; cv=none; b=qTL11babrAMSFkyssxvkaNfJ5CSYujM/LrGkD9A5+4hJWi/8h0LamQOK3A5Us0fBpO55AOYrZUhhf5ES3XssSPEJeBamAVAkwKssdlsF5lXXGKGtrsggWDDlHNgeBXQxsqF6JppaC02N4aYReRjYp3e7RN5zhOFfFpjJRDCXc8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743940554; c=relaxed/simple;
	bh=suNOTfr/YNZFN6fKHQkFgzEELmU+EjwrNjediZCA8Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Afi19qYUc+3Cot+wtZCZj2xfDsokK6Vn8tkNI5fJ/CuH8/CHyovkikwfXiLQm4ReoZa+jRUjTGKe7ORNH1QNLF7YYURt/heewTJZ/OkO9zQQChT5MPV2AI2IgF9yw+uFz1iNXTzlvv/XV2nl7nnbfWBoxxkosPgGLcwroZWPOj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXN1yvj2; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXN1yvj2"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff5544af03so1028685a91.1;
        Sun, 06 Apr 2025 04:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743940552; x=1744545352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILU70+EHjIDSIaY7WTl47NE2TYxzfvxbyces6ACAA0s=;
        b=LXN1yvj2X1zfla841vlGanLp9Bn3i8DzQutg95/Vo7tjvWJwZW42pKqlW3Y5F6dRP+
         zXhIU2QjmeboaEkrj4+8aya9W2tuzWT6wGLjNNx6C7nJfe082fKBMKzg4oDdJ+LiRl1Q
         oM2F8YKnl3X3CdXVvVf/m1UPn7mv/3uNetRe9qdWR8wCR19V2WD7wbgy3UaezVwqw5t2
         60zlQMMa48qP4GrV1RqkbQUii6NYTNQRHSDq+9+aAPZpDVIGjA0QixquLFdFNaDftOgN
         /zULyvD2tVpe92jI8GYJKUEaWXSsbPbm7aca0583dhaKEwRGpMa5c6xGDFtqsltpPu82
         AUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743940552; x=1744545352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILU70+EHjIDSIaY7WTl47NE2TYxzfvxbyces6ACAA0s=;
        b=SOBTNUxBzB+Uh7OF7CI0geLHTRfPL+fcR8NR8zAGPYIMnRsv6mDbWPC5kRXcDVLPVZ
         beq6LMQjDXRnGSnmDRRCilnxagUDoXIwUVBRA0OHEz5M8yFsRug30p6m1QsP5hEjIF5N
         fgjWG5spu+k1wrlbtnrKqLXK2P9GfumQ9wASWQYInrFPp2rB2uwrPtamGFhAgSRoXCFL
         vMbRH1Jds+2QNObHt/dEhmdbNJ5t/xwlWGL+JTPqwiVUIiXOSupzr7XQ2KY4rc5VTDaQ
         xJLmmiVXncbZcH25zaRrufBJNY52odVZIl1qZ4zt4FHIWtpCm1IHUjr0DMVPKaT/VkWP
         zXNA==
X-Forwarded-Encrypted: i=1; AJvYcCX8L0lABUdkeml9TEpF2rYfGYZFQ6RDQSmuK5nhi32LZjijCu/tMiUtLPCg4kWevd4c+XasWwx+1Ebd8p8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVA9dfY2EZ6rpLNmVnNS6WY/lQLEp/bFEDAAnrSk1TGxkJd0v0
	VgW4wZq9CYjeliBjp5aggW6fyylgDvOomgs1SPggtpv4SU0ETaYXfWFPbmygIhk9AApl4MhnoHL
	scGzQXOcvbyd7wI1Zy+JKY/ULyTQ=
X-Gm-Gg: ASbGncvMNb7CNWFrv6F9xRIWzEg6ZU6hjrPvgu1sV+nvCcAo97ZwTnIOYvy6I7rfCYH
	KqkhKmSPiNb5/T56KZ9bcctZTUiectRFe+1Xdy9Q6sEDkZS214FQD6+b+wzbBd7dEdVjNAIw2Ys
	sBZzHoO8tonhKpJcZhpXRQk93G/g==
X-Google-Smtp-Source: AGHT+IEWWHws8/u9BPGK306cCUzGQimILJG9TjNpwQv1ItukQ3vuptggNaYfLMXH6nG/4rCWuMevtKHZp8S1bwZlBp4=
X-Received: by 2002:a17:90b:4f4a:b0:2fa:6055:17e7 with SMTP id
 98e67ed59e1d1-306a49ab484mr4889067a91.8.1743940552537; Sun, 06 Apr 2025
 04:55:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <07D9F73C7B35C74B+20250406112605.6152-1-xizheyin@smail.nju.edu.cn>
In-Reply-To: <07D9F73C7B35C74B+20250406112605.6152-1-xizheyin@smail.nju.edu.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Apr 2025 13:55:39 +0200
X-Gm-Features: ATxdqUF7FSGJ78e5lilCw9AhK2qJ8vjfdbkqRP7h0m0ytM0AaqL23Nd7kfEQHTw
Message-ID: <CANiq72n5C4YA_=HYuSKZnhYJJ8Fnby7n8ME9u=P3=Ycu7hnonw@mail.gmail.com>
Subject: Re: [PATCH] rust: convert raw URLs to Markdown autolinks in comments
To: Xizhe Yin <xizheyin@smail.nju.edu.cn>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <benno.lossin@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 1:28=E2=80=AFPM Xizhe Yin <xizheyin@smail.nju.edu.cn=
> wrote:
>
> than Markdown autolinks [text](URL). This inconsistency makes the

The commit message here needs an update. But, yeah, the contents look
like what I meant, thanks! :)

I think there is another in rust/kernel/block/mq/gen_disk.rs and one
in scripts/generate_rust_target.rs.

Also, the changes in `*_vendor.rs` files should probably be skipped,
since we try to keep those as close to upstream as possible.

Please Cc also others that may maintain particular files, e.g. Benno
for pin-init (you can use `scripts/get_maintainer.pl`):

    https://rust-for-linux.com/contributing#submitting-changes-to-existing-=
code
    https://rust-for-linux.com/contributing#submitting-patches

Finally, please increment the version number of the patch series when
sending a new version (e.g. `git format-patch -v3`).

Thanks!

Cheers,
Miguel
