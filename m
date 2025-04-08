Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4301EA65;
	Tue,  8 Apr 2025 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119268; cv=none; b=COXzkPhVuAy6pBgnScpMvE5lqQYjExv7A+9xUR/eng0+x/Im1VlY16tlYdXk0apmsfica/slwtdyc8jPYVCZ4NoM+S2VpjYaI68CnFklPy5LgNKRFlnZdrBCxrRc7DsHVrRwBhdcZPiG09eyPHrC79bLlkgP2JWipL3dmrtmK8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119268; c=relaxed/simple;
	bh=411Ez4gUf+PPQ0Wkm6N8Om+ZijBspEASwlNOO8RTqbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IHvGlDUAIUaKxp0zW6dexPhBje55yOxTV0115ZXnfeKaNl3hECbw0MhqoBLgrRaT8LAGhdiFEugji+Y6dmWfApQe2bFmlYlSjg8SJ04o93NKdJE9A4Qx//L/SKETsCvqyALFGuizld3Iad3N6TvnJs+qKr+vCvlhgPu9r3ypxt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dw/W3kam; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dw/W3kam"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so1149346a91.0;
        Tue, 08 Apr 2025 06:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744119266; x=1744724066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zX26Qk5SatOtBLsQoeTiKbsjY4GKTg7m3OAXobasiiA=;
        b=Dw/W3kamxRwNzIkuO+Hp+Sm00RU3s740USF0zhdhCocqnarZuFtZVkWBlBBJz9RjnH
         eEsowp+C457WHgtxCbuhxHTQpRbqEop9w/Esp8tQwR/2sP4iLE2/DYF023jtCCRjMx9l
         +05lA0W1F+k3AcxYvjyqfb3f8qR2rYXsCEjYC0s1OfaGd1zQi+1poIMBf22C1Wq55Tww
         hSRWs6fgg0hnqRDGV2c+4800KL8MPTEno51/SwkX5CiO4KmSozx5PEDqGOBQ/lCoyHNr
         BOmkU+8viGLoY5UYFl5KrGwdayKHJRF65zxrgEBePW+Hul+wYwN23XeHKfHHl/DyIf5B
         xcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119266; x=1744724066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zX26Qk5SatOtBLsQoeTiKbsjY4GKTg7m3OAXobasiiA=;
        b=Qwe0mMuY9Yk9hgvY+dFTXq0yFx5HVNiQEFjJ07yoUF8zErZ4+ME680GT7DVXcuovil
         t/Z90ul/IdMUVi6GkYpfweONtY6l/MSpdu3Iy/hkPdxUQn+CF7JTrw53Gq7MQjEubfMG
         uJfJCFyyQV1wYGdpvrRcJ7ov32EvDdsJNuGCRQbxl4HuUK758gMsF+cf4DJV9+lMIjd5
         gxZQieeRS9gEsl5BVzHoymVVyXPB8g5b04VMByckQjCXj/9YQn0vDIvO6GVkvsY79NcG
         KJPyFe6CI3aNG9JCjDSBIu77Mq7FIKBsv0/ZvQA7y9MAMQ7sOl99IGAIW/CFyThCno1d
         uD+A==
X-Forwarded-Encrypted: i=1; AJvYcCUL5LSbEWdCHwURDPsOslb5FKpFam9QifuJekfT0YrLTQ5CuPk6sOEfLNi5FIMpLlbn3OlQ6u3QqoNyMTc=@vger.kernel.org, AJvYcCUt7BPkoFAJu1jGdEAcKlop7CImiF3OKYplXhPUugFGC/9TELlHxi8IUYJAEciDLsmcWWm1hImPpIBjpdTVhdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxotagZhsfHkZhamVfEt4qYgj+wOOt5HSqvUGKeeLMuNY59h9qM
	7saM0mgqED9CywmWamL9gzXQU0xQV6Ss2jYDiUI+tRUYquE7JnV2QIpOIsNBEAx2C84D0G5EvDu
	RoN5UHYevwnVubyBOZeNwGPQTd6k=
X-Gm-Gg: ASbGncvxgigQQTU8n/fRnHOp+5tRUQQ2GlNXniCru14CLKWjZYQNgcK+5bWfl8fer0I
	XNP2WMtxxpttc5JgT4IbIZQPnfwFNa1eka2RAtAscORt9B5Iu2OgnWDxYtK0rfjgNyzfx2WOpfU
	nqbkYICBt/VWX0S/SlbRWJyIzKmA==
X-Google-Smtp-Source: AGHT+IHcq4EUgp5Iqa1qm+n+D0VL23C5HVqaoXE0A3FBJOcsRsJ2dj/ietDD7S4vT1adOFrbI/kcQWhlhS+m7NZLATQ=
X-Received: by 2002:a17:90b:384d:b0:2ff:7970:d2bd with SMTP id
 98e67ed59e1d1-306a498e230mr8715147a91.5.1744119266243; Tue, 08 Apr 2025
 06:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326201230.3193329-1-abdiel.janulgue@gmail.com>
 <20250326201230.3193329-3-abdiel.janulgue@gmail.com> <nujfDI6IKBsjlQtGWaMrhjZSQYYeQYckCyOUs9jIzgZGsP1WTalJE0sSg6tp_WMACWo9mzuDfpdzsIlmkKnL8w==@protonmail.internalid>
 <D8REH728BFP1.2BGE9DTRP2IPU@proton.me> <87ldsahlxr.fsf@kernel.org>
In-Reply-To: <87ldsahlxr.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Apr 2025 15:34:12 +0200
X-Gm-Features: ATxdqUE0Cefmm1_5lUv9FqxWq5Fl0OBZj8JSRTuEMjQZc6JAlEH1sJXPGSEU63A
Message-ID: <CANiq72mahS0jiOHv-7RE8QWQunYo0bJqeGo-FAVoUL7v42RsoQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: dma: convert the read/write macros to return Result
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, ojeda@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"open list:DMA MAPPING HELPERS DEVICE DRIVER API [RUST]" <rust-for-linux@vger.kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 2:40=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> But the `assert_eq!` would panic anyway if comparison fails, right?

Previously the `?` generated by the macro would return out of the
closure written by the sample, and thus it wouldn't reach the
`assert_eq!`.

Expanded:

    let _ =3D (|| -> Result {
        for (i, value) in TEST_VALUES.into_iter().enumerate() {
            match (
                &{
                    let item =3D ...::item_from_index(&self.ca, i)?;
                    unsafe { ... }
                },
                &value.0,
            ) {
                (left_val, right_val) =3D> {
                    if !(*left_val =3D=3D *right_val) {
                        ...::assert_failed(...);
                    }
                }
            };
        }
        Ok(())
    })();

Cheers,
Miguel
