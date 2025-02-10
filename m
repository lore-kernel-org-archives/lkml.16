Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F0B1BEF7E;
	Mon, 10 Feb 2025 08:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177670; cv=none; b=NvhDy5YH2ssVn67FA5TuA7W3WK18XOlKNzLr9j+d8qc4Gc2vfZN8tQuw2rw9L22eVm+bPrZtB2VehDhtOeBrvUIhEHkMBCcI5qD2few4ZZ30e0SS3v6rVV1tcg7rIy/4086w5SPGsMV2o0KXb4Yv5n8IDpySBPO+UKkAms0tVGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177670; c=relaxed/simple;
	bh=FqHLXPTE5JOaOFlcnuZckn2lMpa/iaI6OVBprZozpEg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=NXNaP3yqV97m0dXVbsnkLeuBSD9QI37NgmrTXbDKVWz6/nPbwtMSabiFmZ7wZWs/6+B8ofjLd3C3AAhxzJgL+iEJ6r9mxoAqFfiSVn5v+3aV1TigpOgXDRZHYaBuXeDEimBfhpkEwG0UNwe74KQGtJbxBxyl4m5cXpHWQlt0aRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfqbfX/O; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfqbfX/O"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f61b01630so33961755ad.1;
        Mon, 10 Feb 2025 00:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739177668; x=1739782468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZY9QxeB6byfsjoTiXPkYkQd3pShX29qM3n0pKB8504=;
        b=BfqbfX/OQrh/fTy3eRVVlfPrrhB3txEau7WvH18zwOLClfkle78uxDqdspCu2FDxm4
         kNSagvrxBM9N49QIeiMQ70j91FRkBVmiQt7hPjKbt6cK8anesmMFWSq20hzfYXeHVQ/h
         hGwlZn49V7t7KACrWb58Su8ka3Lgm/BYblFz6ZPIwDPMjYY6VgpQw4HPAn6LhJowJHCX
         NzYdmKdnTugUyZ7axVagXGFNolQhvDbEBubItoEV33jaxip66YPm4hbwj2llGISSqj4J
         ktN7UYY32GhEiqEhy5BsFe8h3At23K87uPeVeiyCunfF21H5naV1OEHlUuSBhafV/v7V
         MGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177668; x=1739782468;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZY9QxeB6byfsjoTiXPkYkQd3pShX29qM3n0pKB8504=;
        b=pzTG1EF/A0UQaTHZNpUzwyJHUdfQDTECt8UTiF/NnVC0vhnfYgILUKG10OYpSHC4gF
         otFyFlSC9t7D3ouwSpwpPlWhXwnJplkLjKfmzYwJJE1AUhcKiFANW8DXDJexPEWAc4/Z
         U+nUxNssOkI4BlHMoLBxLNqy7Ixvjzj5JNfWS9dnj2rR4tnMOuk+veH4JVSAuy/ToWcV
         3mCfHpwtxLpsQTQbTBC6tNpO7rxPOlJJLqZiLOZEaXDLxRk28koAgVeAMwADUaWbKk/h
         rBVoEuURQDngqmYktNffY830xSqlS/vZHzj0lMj3ByHM7D/ov4BJx4f2TE8YZZnJCoGH
         qnpw==
X-Forwarded-Encrypted: i=1; AJvYcCUoMMtavr93Miu/okEyzM42JieMWrw87RJ92SNIHEdkrzLRfYRCQuAtbrsXzyVQgXfnZNdcQ5PPAvfgpKUr40o=@vger.kernel.org, AJvYcCWpdnyXUoJ6b1K7Ytf3t8yYDapz4yqN6/VM6BdFqvLxtgeahhFxfGuO/Iyn8k4CwN4jF1qBgPGGxjxxTQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE/b1no5miaWKWWOVD92xY0Ar/sGG/guTfsy62JtvpaN9xUFIN
	1wN+iWLVdafxznaHvoDcNhPUDtRhOcXhHZ6PtXdp1t/SlaoJnv0a
X-Gm-Gg: ASbGncsPLYYTKP8W4RNu8WjSyIYS3VJmkUGF+oRmhGbyCeJfV/8fVmg1ckEjEQ4PVd4
	1ugWMjOteH6sSXFMkPr1xn2t7++n/5OqHTXXeUgyKKT8+Tb2K3civm2R/wr3mgPs2U8WCN3svv7
	Wx/2Jz/eOpoBvjJZ1+dkCoiqHBRYP1+uo7G3++h75WKUSbW6pHHMKMMVgsRgfYncrIRccuC3EKD
	5XPGUL0hMkw/AgYHu3NUMATaH1pMD3m3Z+Btk0DJkPmOeW6FZe1oCqD/ptZEMQZnq6TFFTO67yF
	RXQuEYR+/PFPh+oERGVpoR6rZiVc3cIbunnILzG7PHv5Cpe2LrMV0h2rqB5LBoHq4Bji
X-Google-Smtp-Source: AGHT+IH4LYd2U2+mMJVrI0jt3gQ3wCg7Wf0JB/MAap/REkLBk8gqHUE92qCKJFDkTSqCyfB6NZEhKw==
X-Received: by 2002:a05:6a00:909c:b0:725:4915:c0f with SMTP id d2e1a72fcca58-7305e504eaemr20232809b3a.11.1739177668469;
        Mon, 10 Feb 2025 00:54:28 -0800 (PST)
Received: from ?IPV6:2601:645:8a01:f00:4c38:12c7:b11:98bc? ([2601:645:8a01:f00:4c38:12c7:b11:98bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730673cfe05sm5080781b3a.62.2025.02.10.00.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:54:27 -0800 (PST)
Message-ID: <b968d31a-b63b-4d2e-be6a-030e323aa7e0@gmail.com>
Date: Mon, 10 Feb 2025 00:54:25 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: abdiel.janulgue@gmail.com
Cc: a.hindborg@kernel.org, airlied@redhat.com, alex.gaynor@gmail.com,
 aliceryhl@google.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, hch@lst.de, iommu@lists.linux.dev, kernel@valentinobst.de,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com, ojeda@kernel.org,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org, tmgross@umich.edu
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
Subject: Re: [PATCH v8 0/2] Add dma coherent allocator abstraction
Content-Language: en-US
From: Pyrex <economicsbat@gmail.com>
In-Reply-To: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm nervy about the Rust code here.

- read()'s comment says it takes a snapshot, but it doesn't

- read()'s name implies it does a read, but it doesn't. It returns a 
live, dangerous view

- into_parts()'s comment claims to decrement the refcount. One, it 
doesn't. Two, it probably shouldn't, if it's supposed to transfer ownership.

- write() shouldn't take an immutable receiver without unsafe

- write() is unsound if used with the slice from read()

- the mutation in write() breaks read() without contradicting its 
`Safety` requirements

- write() memcpys T, which isn't explicitly Copy

This doesn't have to be this unsafe. AsBytes + FromBytes implies Copy 
(or at least it _should_) -- so the view could be of Cell.

