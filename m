Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F64382864
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030077; cv=none; b=I3rPebneNqP2NvEY7Z9Nppj3bB7wrnI98KgoDPcq2dDlMgPr4n66zVnrxoINBQc+3guK0lKGkXgk1douM82qE0SLEz4Eg0riUWoCZs60GI93ts3WV87Zzvy3B8sXwIGVj6/V7zeYgAUthCPC+AheI4TkVY0ZxNnsGMbCl/bAYsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030077; c=relaxed/simple;
	bh=AilsY6EElGiFXAgjqUTOk9uCK8Q+mlJytFww8/PJcQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgW4qqVhhsaKgVtxmI9fFzxjUgQFavL6IyH2hw09tYmGhBa1O1sQ2fj8EpDE+JfxXkbILcGHtoG82k33lyz56nwysnIQmoQxq5LozFom48lewnG29UW+JVmQ/4hxHLk0bN6yhkQmbBoecHHYBiLCVZ0iDu3bwkRJx8VPWDVN7vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZnhRLbn4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZnhRLbn4"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a35c894313so5886787f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749030073; x=1749634873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AilsY6EElGiFXAgjqUTOk9uCK8Q+mlJytFww8/PJcQY=;
        b=ZnhRLbn4rM148NhO7DjvLFcmbZapxFG9ktoY18kvjFKrl/CqcJ83ujCcQ3IkyFqSzT
         EP0s+BypXLCxGvTKAUDzvQxJkv0S6TYW2MwMWH0g3Zz96FZN/5uipli8UjVSV9V5coGC
         CyZOekJDBs3nH22Fq6noifOpKP8l+HwYW4dfkRazJQjj/lff0OPkR4uCHD+/BZDI+lI6
         3LygWFDjCRQX8gYCQyTVn5rC6q+3KtbrXICymRDQdokLltIuWWfi3CxI3N8mt5JdB4J5
         YgCe+bSy8qJUzKRczZ4Khutr1PZ/mbGfWFjV48YRWzpULYyqd6lr8xw61mr8FIYv5PxL
         5Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030073; x=1749634873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AilsY6EElGiFXAgjqUTOk9uCK8Q+mlJytFww8/PJcQY=;
        b=tnu0US9hFMhDPDUBwiAJH7Gs/oUXojY8bezyGwd7qGY72BfPwi8OFExnRhbkStGzng
         ZMyq6KATcKxHvlQXvSq5xVAeCS7y3ii98BgjDKJH83UrJfp4h04wadGhBBxkQCEUbEAC
         ibngnkqnBrrRzkpKkCwaojB1IzeTbF0BKwQIlRb14CeIH/D0RZmESLOBU1CyBczRbzxr
         vyMPxHeFmmcZb/KnN4e4KlLenLf7dqze2eJQMYK18SyZyCFrA8ra7juLuf1C5mKy6jiq
         JXlPaLg2j6UdJABV4B32rBNCR/aeKExhyMXWbyTAXLucdOtrzU4jpyroI4S1qsd+2qNP
         3L3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiMS7isQgas/dLy2Yp04S9HsQm6BZDi87c9Fznj9ToQc3YsPP+wszqeb6AGMU7t8XJIe3mBf8s+vpY2CE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3DYJGNkO3T9UHWKIlRCT+rQh+YWm28+u7nsl2RuvqBtpHlYJ6
	yJK7xDk1JZ1WA1+S4QBMDxQYgZXJAnDNGeIz1vYW0L5kQ69H57c4qx299Yc5Y8tBxolz69wvHxD
	IjM6XNo11VyAZ6a7/MWXpWUXEhWoT0xh/yTnm5gD+
X-Gm-Gg: ASbGncua5kiVokVsi7HTz532trjfQ3YUevH1MZj9cyRIjA7FGGv6/p6sOnINIIoVNp+
	WntfF4/0XqO+Oz9PAvAYqorZqSZsOgXp8cz6uN/cDi39QZkl/2akza4DZ7++TfcH1mFvNiVs+iC
	8/wWtMKzkVz+8BHqBXyb0EinKhTQsBuk82oXri0MTB/5bVEO9bh+teB+xKVXPz6JQxpWoXXxy7W
	Q==
X-Google-Smtp-Source: AGHT+IHDAbTmjf1eaFCyomYeyVDh1falOCkI0ZHgnJv31XoEItpUIeYrusiChA3cvew3koY6VaKpQlpK5zzhX05QGh4=
X-Received: by 2002:a05:6000:2306:b0:3a4:d975:7d62 with SMTP id
 ffacd0b85a97d-3a51d95a512mr1655359f8f.35.1749030073484; Wed, 04 Jun 2025
 02:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com>
 <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org> <aEAT9B669Qvi0rlR@google.com>
In-Reply-To: <aEAT9B669Qvi0rlR@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 4 Jun 2025 11:41:00 +0200
X-Gm-Features: AX0GCFuGYMpyWuK1o8MZfqHtJCktp69_UMzyH56oWOUDGHY0MqossbvR6xJKnek
Message-ID: <CAH5fLghzLqVNYXSe3kBWPdzp3NxQ2rLAxy4h4qzoGiVT=XXh2w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to MiscDeviceRegistration
To: Benno Lossin <lossin@kernel.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	=?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 11:37=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>

Please disregard this email. It was empty by mistake.

Alice
