Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5D42CCC0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874044; cv=none; b=oKxF0Fsk3oWfQygMH8Czy7GFK+G5OIEmLpezYXPSlsG0h9zADvsw//4oeJB8cEzBcPqzYT/ebw4BSN8ol7zCe+iAdT5DlNCBDbrIoVhzWjwB8pKXCS+7mvDEHm62ft970rmLZykRInTOagQ2vMVe/b5c04Rfbfx1pK8a6KhHOxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874044; c=relaxed/simple;
	bh=EvVaTxYSOCEFwRObssSwzCT7FNsnxAftH2lmiKmLtYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J17qJQaR2Vkv+yJ00d4s0cs/l8FsU46yJ6vgBBfo3gEgLHsOxc/wWaoslObpuAFyzSqnFMV2scxKMcC8tHNWhsQqmEHum5JRSbm3RZiNmz457tH+GsESFVxoeLY7GBpFneqHWdvlhiBhJk8dkj+5S3JHge3MqHI0mVTdSDzso34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=jF3Dq1sq; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="jF3Dq1sq"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e6df4507690so431197276.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744874041; x=1745478841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+O4cbDhgMk+GYK9ZCD5HDXYiPfr9BlYHfrpcdjbwwY=;
        b=jF3Dq1sqe1Xn4SDDqkr1ICKxEHu/gL4Sx8bLRPZdqLeMsiMVG1DN8MhRvH+2XCqU/U
         7gtBq0tXwNWmtk3P1Z0/6MnbiofO2Ew6/UlDDvkLuYSKxdUSSBXrnL7OIu81tw4YqWGR
         v8aPMHj4a8OzuQTXaEtIB2xd4EqzGQ1M2s+Aaaz+Og79C29gjXt52X9H4oScRRWCk2X6
         XIU36oezyBflkV47d3qijAKAsixKtrHUUcWgqQ+vt6o8a0ciUT0xHVz1z3Ygk9VGc9Aj
         tFNTPqY5LJpQIyll5n/iDBWgMhRB4FeRzzyV3NXAj8fh8NueE+EHAT5MrKem5CJU2qAD
         hxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874041; x=1745478841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+O4cbDhgMk+GYK9ZCD5HDXYiPfr9BlYHfrpcdjbwwY=;
        b=W7OEJ51ooPO4Cw1PncrnZhHrzimcii0sUQKmN47A5ygbag4ja2l7VHNFipQW1H6+nQ
         BK7hfezP0KYiDx2YKPJORAkdeuWhDIU/AlHsBHS9bpeG+wjHCzdH5CCblA5qgnWXDn2D
         d8mNMjlWuN6oyZTS54Mujp8wCbALbP11Btcu+6h6/FXR5Oof561wvqY+jdHSLmFdeRkc
         ASQhatYtjkRXgXwN0B9GCwjABvzKiwfaxOfA7BmI7FMIAhytnPafNFT5/6XzkmbLRSvx
         ifhfTNL6vXW3Iw2P863ZM/0TLpExSqVf8yLOGKS0T9O6PnlqmivGbNLfpHNrsmeHKBa5
         Vrjw==
X-Forwarded-Encrypted: i=1; AJvYcCV7XTeJgxv/S3+Qo62dHJN95Oj6X3qDE+Q/cybq83OQBHQcl6iYDPjMm3LMACcWhJBDsLN9GnY04qGmApE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTcbG6qv+iLqIr9l6FaurdP5ssVG7/h/+DrP8fKGm8Ldsd4Qpw
	kKwFKsHZm+WiA2meRXPBDVmhwr9n9CgFFvt1a9EqlKxJ3BONLWorN5mwdVx8mlMRVZzl4wmWYfj
	6echXMsV4zPnuOqvEKp3DMhx/GwFwIz4MAzoQ8w==
X-Gm-Gg: ASbGncvPMNUGv7SpxkB/j/+w4pecL3F5XnZPiY/zmHnAqUKRXd22b4nXHEC+wHik/nI
	bPTNRqS/5vuGqxJ/X3noQqDv95wJpO+chpcjQDO6wGYWl9lP9q2Dyn3IqZr9EacAw+bq+aO9k7n
	s9JbTmNQItWI15thEK1hUdQg==
X-Google-Smtp-Source: AGHT+IHjXNHcgEMNPn9/Qw7IhtVV083uTrWj3Mps+4tKHWowHe/w0s+WaarAR3B1zcpfezoETNmT5G4le8YXRdz96/k=
X-Received: by 2002:a05:6902:2204:b0:e6e:1a1b:c026 with SMTP id
 3f1490d57ef6-e7282c816e0mr2452242276.12.1744874041720; Thu, 17 Apr 2025
 00:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-7-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-7-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:13:50 -0500
X-Gm-Features: ATxdqUH-xs-hRAvXvJIhLuBMx7vKXsYwZ3FYn9EB3zw3sXP1TOy3akDce_VI_zk
Message-ID: <CALNs47tpZyV24o08BKOxG44UjSQEmQcW2mkagd7mnkqvt=euig@mail.gmail.com>
Subject: Re: [PATCH v5 07/13] scripts: generate_rust_analyzer.py: avoid
 optional arguments
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Make all arguments required to reduce the probability of incorrect
> implicit behavior. Use keyword arguments for clarity.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 90 +++++++++++++++++++++++++++------=
------
>  1 file changed, 62 insertions(+), 28 deletions(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
