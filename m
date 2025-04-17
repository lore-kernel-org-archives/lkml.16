Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE6C2153CC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872972; cv=none; b=Yh2/x1oKN6LJ4wYmPMyf3pdOdXx6zeQAwYKJE+gR8tPnMC8olZncuWNyqJnCNQGo2Eax+LebrnIDExE9ygfU8YqicQ/d6Ilo07zsoxAp9gQzCZTKINIbbuChBQsuG5IlrxUIY88tIndjv0RTKdIs9I02KflOvB/xc1W1lT8b7/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872972; c=relaxed/simple;
	bh=TVdUZWWglgOqPPfDLDVo9eCE3ljW1YAkEEugMqmwKdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oMa0NoyPW/0eVFptoGU/VN7drvIm92m6yjqDLBl7WiPCXUvYNI3i9/H8djANTi4hac2VEA6ZuJCCscchJ+mKhcyFdYgHEGwm+yUdmQb3cjJgKP72rtu7tjfs2AbzMptKls1y48brNDzAC+0OICAeNaKuU9oG6PJSGz/P+KSfVwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=fsRH7OVW; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="fsRH7OVW"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e6df4507690so419986276.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744872969; x=1745477769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wpx5Nxip0kMwUv1rxDhMlvZV61V+9dPa+zk+LPDBwlQ=;
        b=fsRH7OVWqZvPGbht3e50OebtswUhpl42WTkgdlf5KFKAuJFnL/b7rvgWfOeEeLsCIX
         NACKZhHByaxC0zqq3NineY6xdCvmcQ0IIS0BbIe+InicHn2YnGk7weQljX12GelZR998
         3GJ86avWpm+XuAK+MpvSwWz8ETHDQdbl4rvrbKkIUzXa3m34vJZYDyMtO1V4zC0G2SOJ
         wqGYPp5BrUXHaNLmGBulLHSgRxFXFn+NEmXwuPT/n+d8wu3Om/wB1Z3vWodXtqYobfPJ
         e7PxvDT+p/DvRqxejkrXQjcpbQIlQH+iWxQj7m1+EW3rTHf6Qegj5eIpxI4LGi6j//Cb
         NNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744872969; x=1745477769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wpx5Nxip0kMwUv1rxDhMlvZV61V+9dPa+zk+LPDBwlQ=;
        b=t5ejjKXz7qDiVW74cyfKmFvrWSsCTS6DJaE8hLA24OaNox1vfaosLObu7+pbUjX/h9
         kHoBbw0kbvZC+TlO+dT6dpwLv5p2R6E4vNZLHu+1cvWvfRCBfdV6+RtXvFoZY52BAY/A
         6bF9MWEdbj8j+xCnT9KtMQcfy04v5IpG1sq2fBnClFlMscF32+ZboNNifcM/mGW+AWz0
         6j8n9fNanXQbPZYXWSIRO6HPdNc0lx3kfwW+L6k18cRcVYQ8qtV22kGsyj9l8F+x73at
         3wqwLIDbNsyCJuQ0mjtkoF9+pjEXehS4iAKY1pxt3DMXg+Rf6a/v1+69peqecFTAPlhW
         Ylpw==
X-Forwarded-Encrypted: i=1; AJvYcCUtN6MmboDblLg1c9DTkyKm6rQB5JT7vUZ813sKVa5rb6b6tG6SfvBuWELCNtcWEwVEwXi+Sv3I6SyXki4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxURDnS5SKW0YcukEXGRc/Q7LfjcuCwQ4L/ORkWnrRRLav5HgTU
	lax2A1iUvfd9u/osQ061T63WliRjmVtqiT/+oPCLa2b8Hes6qrGIIGyoVoIgNI3fw6dh/6pi/8S
	JAORJVS5Q4ZAJAM3sJgYhX8viV5brPZNBa7jdAA==
X-Gm-Gg: ASbGncssc54y/1H467Dw+ACunYeAoa9uZ0tDL3IXvJXagWubC0NsrfwXI/Hh5adP2uc
	YTkcn9aj+ajGCb3bYOyjuEnNFHHYbFRay5VLS1t8ZlxCPcSRE+SaAmkYIGIobZUIQ8DIbvBqkGs
	2MS9+gswU9DBjD9dL1PKiSVg==
X-Google-Smtp-Source: AGHT+IHi19XvyKL4/y6y7U3hAfkahZ27sf1NOGvOggYOW28+/ISGy+g+mnS/Aixp51ThOQOKr1pn3x1vji/Ote5wXLg=
X-Received: by 2002:a05:6902:70d:b0:e5d:c1b9:4a7 with SMTP id
 3f1490d57ef6-e7282a769bdmr2630257276.23.1744872969402; Wed, 16 Apr 2025
 23:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-5-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-5-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 01:55:57 -0500
X-Gm-Features: ATxdqUFh3XmDZUpJHPLk8vG2JmPsWuJCmizy_Iy6hLN6oQFpSaxY0TK5uMvptc4
Message-ID: <CALNs47siqmRedAuyFGfWSEagf+aO-e8LwHey1E7pVvM6LBmvOQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/13] scripts: generate_rust_analyzer.py: drop
 `"is_proc_macro": false`
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

On Tue, Mar 25, 2025 at 3:06=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Add a dedicated `append_proc_macro_crate` function to reduce overloading
> in `append_crate`. This has the effect of removing `"is_proc_macro":
> false` from the output; this field is interpreted as false if absent[1]
> so this doesn't change the behavior of rust-analyzer.
>
> Link: https://github.com/rust-lang/rust-analyzer/blob/8d01570b5e812a49daa=
1f08404269f6ea5dd73a1/crates/project-model/src/project_json.rs#L372-L373 [1=
]
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 55 +++++++++++++++++++++++++++------=
------
>  1 file changed, 39 insertions(+), 16 deletions(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
