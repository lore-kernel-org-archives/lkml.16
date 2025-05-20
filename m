Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8141519EEBF;
	Tue, 20 May 2025 21:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776753; cv=none; b=dghWz4iNmGXS6xhN5RoJZjhUzpCv4/UwlypXjaHFimjo9I/3D2uzV38QbN8Vx5zBKbpFkmHizOAP/hoygMfGCJwaOph/gopjicAhlqI2VUj+E6Nsvi+5D3iPQKTMaPgGYIkvBUN2XdKbb9rXaOqYqynxgnR9z1HWkFoiC4IkHVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776753; c=relaxed/simple;
	bh=9RE2EISU6c/hbKUEQN54v3k7Gdmvx8O8/Y1FSzxrXF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLwGo4sUYGt6D3H4W7utjtsZ7XVM9j0JxS/yMVD6bgPw8dU6ki/xBNvjo2qthbI/zvEghSC02cUSzq6lc72aGqm65de74xufbjILwypLqX2TcOvi5P4x7jITaYy/u7fgNZHZZHq0+yfeH2rI2+cAce2eolP9PYvChAezVixXWbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAI8WccE; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAI8WccE"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-600210e4219so9339648a12.0;
        Tue, 20 May 2025 14:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747776750; x=1748381550; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PVyeTtgp442HJDMgT08Hm8NeOQ55yWX3pvKDV8NYv8M=;
        b=LAI8WccEX7VosUYBMNolLhLwXahB7QTbH/TdmlsChjzHNfxr69NC32dzPygo72CUyU
         UBJ8qLSfez9nkXyfJK/xvllERi4jDj/HtvASRgguzTyFhtW+XoXRrhDee5UpidWoUb7j
         q9orX0ZXFxRtNuYNRxzq0K71MwxzABPZXfqMOiPGJzALusk4I2k5sZ4xs9c2jW2kD3Q8
         AjhFYXyM8LJ17wItEIZ42mhFhUmchz7j1DRamlHZDWrOqpAkBGUonjVt/odsIc6ixoqT
         j7m/1+t44TkpO/IXITk5I/wxHOR1X279/Zdjkf7AIPvobtvAaVhF5xWXFMnDgOdOGRR+
         dtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776750; x=1748381550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVyeTtgp442HJDMgT08Hm8NeOQ55yWX3pvKDV8NYv8M=;
        b=M2insMWz7p5bTWJ15lqEGJ69mKQCez5mLbxwTZ5yrNaBwvAO08k3l7xuFmPjg82gjv
         5dfVOZBITrPABIWv7yscCuBDsnlj0LXLeT9uVuZF5sXqx5Rrw9odzKv6bPiWZFvbrajm
         D3x8g6wVQ6rpG1fh9hCMsMyuPQ5yJ168QruoAw6YNmzjXDfa2LWOWKZwRx03pxFNxneB
         rs8LfsmXpLKocTzCf2mZiymLwNBhsxFzacGWO60O+kR/OCNTzXlcXTT3riej3az6GESU
         11umia5IKS8gtCrZQr0x44gYzxgMYpv+RWTNED4g0gYHcEtkoD4mpHlfy4fviF9F0cOj
         WrAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9+RWEcdYxH+Z09o1J6i29XO4VlC2Yzd1l+/kkKTOxzmON9j5xgbN5ZnziIWIlN3ltubMbNmNvbclsjus=@vger.kernel.org, AJvYcCXrCcB8zMF2Y6Wt3KPb8dyyZmZiaTzW0hOKAAheDhVRo8hR4yQmGdF4SiRaK6dH7TJyst399WuhkOSQyVgFC1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTUMUvb3tMFd5Sd9+syYLgU9K6YZnamaj2/VR3dRwiz4VvRVhu
	dCdHHSBnrZcMHXztY3S1GVf2FqMpxCfc+CInHnGizwvDvtDsJlrOBtUsLKZivLdE6F3XOX2u8GE
	l8u2/aM/CirL8iTl3Ee9razowG6cV/KU=
X-Gm-Gg: ASbGncskVrpUJBPoTg+C4kUJmRV9t6saJ/0U/Wm8/l/KteZf/B7nqwKCvVzCzEQFZA3
	xJhRI+6yekUj6zvKfRrBCN65xqupG/iqb37cXzIuyvJjts638DmxfN1FaC783BBSwuqimLpy+wN
	5gOo5r5GyDLiCKTiey6OL9nJNvLUNEDLE=
X-Google-Smtp-Source: AGHT+IE6ZfjH0fXFNg73kcmkQydRGkPJxZXm2rI85X7IwGpF2mp4Nj2W8aK6jolZcs3JZ0Fq7YjChtSqklpPuK2uKKY=
X-Received: by 2002:a17:906:4ad8:b0:ad5:46a8:1ca4 with SMTP id
 a640c23a62f3a-ad546a82c11mr1220923766b.7.1747776749497; Tue, 20 May 2025
 14:32:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
 <20250507-nova-frts-v3-16-fcb02749754d@nvidia.com> <aCN_PIYEEzs73AqT@pollux>
 <4fee85be-a8c5-4a99-8397-c93e79d72d15@nvidia.com> <aCxLyxcERNHKzfvI@cassiopeiae>
 <3cfb7a8c-467e-44d0-9874-361f719748b8@nvidia.com> <aCyZPUaPSks_DhTn@cassiopeiae>
 <bdb290d4-b369-4b8e-b78d-8c8d3cc07057@nvidia.com> <aCyhkiBTXV86P_GF@cassiopeiae>
 <dcd249d6-7e99-476e-b216-8ca9e1a936e5@nvidia.com>
In-Reply-To: <dcd249d6-7e99-476e-b216-8ca9e1a936e5@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 21 May 2025 07:32:17 +1000
X-Gm-Features: AX0GCFtnnWOjvTVc4bevf2USIhVR5JOAj-n3PIwluhf2VOt5T6BTyJ01ydh9IxA
Message-ID: <CAPM=9typcavVsj-w_4zaBkU=eo-hsOagHn4cMekCsXPHwLK3Aw@mail.gmail.com>
Subject: Re: [PATCH v3 16/19] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Shirish Baskaran <sbaskaran@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 May 2025 at 04:13, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 5/20/2025 11:36 AM, Danilo Krummrich wrote:
> >>> If you want a helper type with Options while parsing that's totally fine, but
> >>> the final result can clearly be without Options. For instance:
> >>>
> >>>     struct Data {
> >>>        image: KVec<u8>,
> >>>     }
> >>>
> >>>     impl Data {
> >>>        fn new() -> Result<Self> {
> >>>           let parser = DataParser::new();
> >>>
> >>>           Self { image: parser.parse()? }
> >>>        }
> >>>
> >>>        fn load_image(&self) {
> >>>           ...
> >>>        }
> >>>     }
> >>>
> >>>     struct DataParser {
> >>>        // Only some images have a checksum.
> >>>        checksum: Option<u64>,
> >>>        // Some images have an extra offset.
> >>>        offset: Option<u64>,
> >>>        // Some images need to be patched.
> >>>        patch: Option<KVec<u8>>,
> >>>        image: KVec<u8>,
> >>>     }
> >>>
> >>>     impl DataParser {
> >>>        fn new() -> Self {
> >>>           Self {
> >>>              checksum: None,
> >>>              offset: None,
> >>>              patch: None,
> >>>              bytes: KVec::new(),
> >>>           }
> >>>        }
> >>>
> >>>        fn parse(self) -> Result<KVec<u8>> {
> >>>           // Fetch all the required data.
> >>>           self.fetch_checksum()?;
> >>>           self.fetch_offset()?;
> >>>           self.fetch_patch()?;
> >>>           self.fetch_byes()?;
> >>>
> >>>           // Doesn't do anything if `checksum == None`.
> >>>           self.validate_checksum()?;
> >>>
> >>>           // Doesn't do anything if `offset == None`.
> >>>           self.apply_offset()?;
> >>>
> >>>           // Doesn't do anything if `patch == None`.
> >>>           self.apply_patch()?;
> >>>
> >>>           // Return the final image.
> >>>           self.image
> >>>        }
> >>>     }
> >>>
> >>> I think the pattern here is the same, but in this example you keep working with
> >>> the DataParser, instead of a new instance of Data.
> >> I think this would be a fundamental rewrite of the patch. I am Ok with looking
> >> into it as a future item, but right now I am not sure if it justifies not using
> >> Option for these few. There's a lot of immediate work we have to do for boot,
> >> lets please not block the patch on just this if that's Ok with you. If you want,
> >> I could add a TODO here.
> >
> > Honestly, I don't think it'd be too bad to fix this up. It's "just" a bit of
> > juggling fields and moving code around. The actual code should not change much.
> >
> > Having Option<T> where the corresponding value T isn't actually optional is
> > extremely confusing and makes it hard for everyone, but especially new
> > contributors, to understand the code and can easily trick people into taking
> > wrong assumptions.
> >
> > Making the code reasonably accessible for (new) contributors is one of the
> > objectives of nova and one of the learnings from nouveau.

I just want to back Danilo up on this concept as well.

When I did the experiments code, I faced the not fully constructed
object problem a lot, and I tried to resist the C pattern of Option<>
all the things, it's a very C based thing where we create an object
then initialise it as we go, and it's not a great pattern to have for
rust code.

I'm not a huge fan of constructor/builder objects either if they can
be avoided, please do, and I tried to also avoid proliferating them,
but I think for most things we can build the pieces and then the final
object as we go, it just requires doing so from the start, and not
giving into the Option<> pattern.

Dave.
