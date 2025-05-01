Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA0D2DC797;
	Thu,  1 May 2025 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746107313; cv=none; b=Yez7ijsKeFcTiR4DWl3WCFBJWZKgHIuLAQK/q+H71AR/Vql9facfgspEwakl6oFsWjonPoYqDjjzJpgQSz0Lfj0wBRvrZBHM4qFlJvzKy0VFoWnbMj/MhwhSwKimVZisBu6euQ6OdwXiFQOnM67mqBHO06NWBYwC8rZcyXY8IEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746107313; c=relaxed/simple;
	bh=R48o6InsWBzLg3/gHZhEhR7WnY27CmLaFxbrPQ7yoic=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bVUtI/iA0poTPtXDLQ/FCe7E5RZuyakBJ7X7Zytclx/2b8uyrQkTb75uvN+aehnXOhK/VX43ca/0qQhxInIS5/jNGrto3OINUEJ2Tf6HW2NUvFevYJPocsM0BAnLpnTetEe3DIYqNlfjElPxqvfxhhcj/mYupc64jBekIYNDesk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJLemkXX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJLemkXX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224191d92e4so8995045ad.3;
        Thu, 01 May 2025 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746107311; x=1746712111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R48o6InsWBzLg3/gHZhEhR7WnY27CmLaFxbrPQ7yoic=;
        b=EJLemkXXdii3qDuRUZqfHf9WDZk3TvboLeBXeRZg6zsENUNgD16ewtDIQOjXuQbJ28
         pKdnaTVKTmffl4MxFevuV1XsUPArFO4C2wVaILnlTam4b0EJtQKssKj70QuP0FIeku5I
         9Beuh6kvYbMrsf0xh0g3YV2frbbXnUbyqk0T+23Hcm75khrFcyMKQHUj32OVKEVI3Uve
         JUmb9nT9HUc1HMtAgPewa2XNU7rb1Myydx41TlN/8qo51sWQPc6VCY3n/eEtWrsixOXL
         mNrK+4t/6HxhJCw8VwMQC4jW/AxEyAg2o7O2Zz/bJFFGgthi5zbFzM9Hlh3hkV68aTgJ
         1HJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746107311; x=1746712111;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R48o6InsWBzLg3/gHZhEhR7WnY27CmLaFxbrPQ7yoic=;
        b=lQKMrx0wpODrBjW78O9yVg8flio4e4cmuzaIryn8vVs6TTwtiHW+ImIhW1G6EvE8Eu
         UvZM9GgVMkXN9MQPrxct/x9YPc2Gj7Ahoudbx4R68SAbKZbeIgt9JDhvKMkKT5lxgJFQ
         5xV5Vf5nsVPjXBLv0I6ZFjB6yGA0zQWi8mBq7cuSTBxb8dSTExA8IAXbAd2ir3NOpari
         SBXBC6uJYWEIqDPVIvWt8sOHWv2DwvkvS26FWvFNOpDf8k6ug4XVz3Tp5/mTfnuGZ2oh
         hopJFQfTIVvIqSFPqqXrikXSvfqVbc/MCZmitjf6iTOKhIpUKNiQ9kaSo7aF+8bCYHGv
         Xbew==
X-Forwarded-Encrypted: i=1; AJvYcCV9J6K0t7SVn2iOZjp5l8mBfgrRn2ABzc5qhRwa8+R5bUrvDG6O2/lh4zCIh1o+S8oLRbxWOXdT4wF/vXNU1n8=@vger.kernel.org, AJvYcCWa5CAv3kSWEnNFqTNIgxpiE8sGOZ10xLMuIQ+fgs5ejc3ffOWZa5MA5rRFSldgHRRjNn2SGEEKGRbY0aU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDhzCZC/Q/Le29mFG0t4X9upu7zAEjNBwG3BAIwWCjcOSqOqpI
	m+lbE5acAr5mekQK5cb2nw2vmueEGcKu4weKVleTB90iu1ZbtDvp
X-Gm-Gg: ASbGnctnMk+ne0hg34pWexOtCsSE4Dtz393ZrKtc4QcFkAZBXkDBNc/nV70pmoHrm/5
	DiNFvIRSZeDje+IFq4EXTfi/+pkOfHSy6z6YfrgyviqOU9eH4EsR19fhFLX+jnEvPMepfdvdvFX
	W676KV6jWrJtENtukG7IphiIVQ2UazToXhfGuDrmoe4ZUdZ5zDpQlkK2+WtDhiqdenKzv06QL8Q
	vTnCcOcYLvsI28SllXDK2rssP9Ok3UD0H7ALH3cTjyUkUH3g7yD9KIylg5UiykPoFfx0CEznYUH
	Cg/ZTnUHb+3m3CgNMUvx8I2PaAvlR0EKA7y5+Ai2ceFB+djFf9JjhHKVcniyJe4lqCWdZAZIgwp
	y81rklcY3sRnxathZeo/0C5E=
X-Google-Smtp-Source: AGHT+IHD6FHplSlj+pposMi4tXExEB+p1rqckTm7xQAXIQisRcsjAh2vlhK2tDw6V5JuAKLnpQD4bw==
X-Received: by 2002:a17:903:2f82:b0:21f:45d:21fb with SMTP id d9443c01a7336-22df5764477mr96937625ad.3.1746107311076;
        Thu, 01 May 2025 06:48:31 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bb0f39csm6597495ad.96.2025.05.01.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:48:30 -0700 (PDT)
Date: Thu, 01 May 2025 22:48:15 +0900 (JST)
Message-Id: <20250501.224815.1854649062185419020.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com, arnd@arndb.de
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, a.hindborg@samsung.com, frederic@kernel.org,
 lyude@redhat.com, tglx@linutronix.de, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, aliceryhl@google.com, tmgross@umich.edu,
 chrisi.schrefl@gmail.com, linux@armlinux.org.uk
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aBNrJgLFpswcgOEK@Mac.home>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
	<aBNojspyH5dHsuOm@Mac.home>
	<aBNrJgLFpswcgOEK@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 1 May 2025 05:37:58 -0700
Boqun Feng <boqun.feng@gmail.com> wrote:

> Btw, I think you're missing the Suggested-by tag from Arnd, of course if
> Arnd is not against it.

I'll submit v2 tomorrow, including Suggested-by tag from you and Arnd.

Please let me know if you're not okay with being included in the tag.
