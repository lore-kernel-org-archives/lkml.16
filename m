Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB1181AC8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821261; cv=none; b=Ctt/wbee9U6UJHMkbDo6Ksde67dibPJSJj/T72iKITfdfOQnqiH/WYB/CyfGDjMTT/uO1Xgc5lzqJXANHfESbzDHUktoF8v+9NHtBWNOFDW3KEjlCMuisg4RRcykLsZyEw8eB8VHhHFaKVcE9AWqZzWVhH/4tx/BgN7FblNOrc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821261; c=relaxed/simple;
	bh=AVakHZUF+bby0IFHcNPtz5XCuUStXtVTB/kPOBeykP4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CYYKQfXrLzFXj8uKUOs2PYkWuediwDYY7g20aDgP30nIQGpgH8nTzsFVbLRwj7RNJPk37laSclUX8OslwPDSil7rN7FHS6qSfVe7gRNP0p+kjQKRslwa8jMBrYVLjsqu/ThGpvRl9nJ+LVtjRLO2yYNDzWomyDAnr70MloUKLSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=IyYwheQ5; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="IyYwheQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1749821243; x=1750080443;
	bh=AVakHZUF+bby0IFHcNPtz5XCuUStXtVTB/kPOBeykP4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=IyYwheQ5c5Wo4IuGswdEsqPe7ffhe9oTCtOh0FEyCn+BHt989lx5KO3OQGaiMkj9F
	 OiC9cht1qo29gSqD5mBwC1PsRsmcjRx4JstF6/Fy7XhlNy+J9A37HrxBYap9kr2u54
	 h/gX+jXd7szhPoEszcZ9OOO0eobhibSpwD8BPQs9vtvbDNoZZUkHLR5uBNQ5kLv6PK
	 I+coipK9zS8PwEVA+V38xvGbX48OON28nVGcByMe+tk459EczZtKsS2p5W3qPfph2T
	 DZ+vSGl1Xvh44ZNj5PZ1zzF5YA9wH14HvSXDYwGU5vCd/v/FOp7bSvil/2hHM8U99i
	 +l6Uzu+I4mPhw==
Date: Fri, 13 Jun 2025 13:27:18 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/5] New trait OwnableRefCounted for ARef<->Owned conversion.
Message-ID: <b0db96ea-5000-4850-91b8-f2c54c0e1890@pm.me>
In-Reply-To: <87msabbxe5.fsf@kernel.org>
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <87msabbxe5.fsf@kernel.org>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 2664d5c37d5f17a4656f9b002b7b7c8fe6200ecc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

yes. I didn't have time to work on this during the last weeks, but I=20
will post one with the suggested changed next week.

Best,

Oliver

On 13.06.25 15:10, Andreas Hindborg wrote:
> Hi Oliver,
>
> Oliver Mangold <oliver.mangold@pm.me> writes:
>
>> This allows to convert between ARef<T> and Owned<T> by
>> implementing the new trait OwnedRefCounted.
>>
>> This way we will have a shared/unique reference counting scheme
>> for types with built-in refcounts in analogy to Arc/UniqueArc.
>>
>> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Do you intend to send a new version of the series?
>
>
> Best regards,
> Andreas Hindborg
>
>
>

