Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859C915AF6;
	Tue,  1 Jul 2025 19:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751399938; cv=none; b=pEjhC+4PoVYsVck6Tvaw8GFchna2AGWFasw3yGGLr09IHyX4vvGu7G1fQuYahShzk4v8C8qIEBgWI2fNjA3a4fFetuNfN+ynvh2dP9y/bWp9x6VsFx2Nf9h+CDYExzrJxWYvMrwoTcK2zG7FPzy5BG3K41JUSbExoo7524gjMFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751399938; c=relaxed/simple;
	bh=ubakxwYqk4IXugWjXGVJbZhg4SGjAZq4XELN0+JXYlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoanU9vBQVJrkjo7eTfYMpmzX9Xocf5dE5KZ6xe4GeIUMGsMCRDupxbA+b5uwpkw3Wru0prWfgu3J3JaVpX+tVAkaRxH3mUEC27FyBOvEaLAJlc9ycljFojNl+iA25XDgQcsCr/8AjXaiD7Q93//U0dwnD/5hjXVhdts7WTOm6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUXKiUEn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUXKiUEn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19E3C4CEEB;
	Tue,  1 Jul 2025 19:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751399937;
	bh=ubakxwYqk4IXugWjXGVJbZhg4SGjAZq4XELN0+JXYlw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iUXKiUEnp2FhoAavxJ2Sn6ILjsmL3j9P+ovym0lvlDJD3iWfcEFCXntimIYmks6LW
	 URUvghBjAnvcqUABPG++odt7k1ps9OdC0bBRPjf+JBqvNUai+RRm368tuW9L57ai9a
	 SvoyzRP9v6yM83OZ+5co1L4t1dBRZgvsSXXpxGyin05swPkJt4bEjD6n3OgJu9ms79
	 5sUdNpCuZvbcesf0I70wFOJO0HYZyndWnENCUhVg2I+mqGqJCx/i+gfyAD4mS2R8Bh
	 kLtkkDToSYpmes0nc7a5V4oqBlMnxFGMwEfobMSporMrUUQqwwLv4ko0s9DpfwQ9aG
	 X/NATh9itOShQ==
Message-ID: <3c928a0e-ccd4-4ba0-9f42-9f2bb0203e75@kernel.org>
Date: Tue, 1 Jul 2025 21:58:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing for
 File
To: Benno Lossin <lossin@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Dirk Behme <dirk.behme@de.bosch.com>
References: <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
 <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
 <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org>
 <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux> <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux> <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux>
 <CAGSQo00eG5oRdN_xORLUyUauLi_vzypU-gz6DSU_FzaAbHRLng@mail.gmail.com>
 <aGQ1VsnFaxBo9zaM@pollux> <DB0Z71SF488V.3QURUHHELOY84@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DB0Z71SF488V.3QURUHHELOY84@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/1/25 9:46 PM, Benno Lossin wrote:
> On Tue Jul 1, 2025 at 9:21 PM CEST, Danilo Krummrich wrote:
>> On Tue, Jul 01, 2025 at 11:11:13AM -0700, Matthew Maurer wrote:
>>> On Tue, Jul 1, 2025 at 8:10 AM Danilo Krummrich <dakr@kernel.org> wrote:
>>>>          impl Firmware {
>>>>             pub fn new(&dir: debugfs::Dir, buffer: [u8]) -> impl PinInit<Self> {
>>>>                pin_init!(Self {
>>>>                   minor <- dir.create_file("minor", 1),
>>>>                   major <- dir.create_file("major", 2),
>>>>                   buffer <- dir.create_file("buffer", buffer),
>>>>                })
>>>>             }
>>>>          }
>>>>
>>>>          // This is the only allocation we need.
>>>>          let fw = KBox::pin_init(Firmware::new(...), GFP_KERNEL)?;
>>>>
>>>> With this everything is now in a single allocation and since we're using
>>>> pin-init, Dir::create_file() can safely store pointers of the corresponding data
>>>> in debugfs_create_file(), since this structure is guaranteed to be pinned in
>>>> memory.
>>>>
>>>> Actually, we can also implement *only this*, since with this my previous example
>>>> would just become this:
>>>
>>> If we implement *only* pinned files, we run into an additional problem
>>> - you can't easily extend a pinned vector. This means that you cannot
>>> have dynamically created devices unless you're willing to put every
>>> new `File` into its own `Box`, because you aren't allowed to move any
>>> of the previously allocated `File`s for a resize.
>>>
>>> Where previously you would have had
>>>
>>> ```
>>> debug_files: Vec<File>
>>> ```
>>>
>>> you would now have
>>>
>>> ```
>>> debug_files: Vec<PinBox<File<T>>>
>>> ```
>>
>> Stuffing single File instances into a Vec seems like the wrong thing to do.
>>
>> Instead you may have instances of some data structure that is created
>> dynamically in your driver that you want to expose through debugfs.
>>
>> Let's say you have (userspace) clients that can be registered arbitrarily, then
>> you want a Vec<Client>, which contains the client instances. In order to provide
>> information about the Client in debugfs you then have the client embed things as
>> discussed above.
>>
>> 	struct Client {
>> 	   id: File<ClientId>,
>> 	   data: File<ClientData>,
>> 	   ...
>> 	}
>>
>> I think that makes much more sense than keeping a Vec<Arc<Client>> *and* a
>> Vec<File> separately. Also, note that with the above, your Client instances
>> don't need to be reference counted anymore.
>>
>> I think this addresses the concerns below.
> 
> You still have the issue that `Client` now needs to be pinned and the
> vector can't be resized. But if you know that it's bounded, then we
> could just make `Pin<Vec<T>>` work as expected (not relocating the
> underlying allocation by not exposing `push`, only
> `push_within_capacity`).
> 
> We also could have a `SegmentedVec<T>` that doesn't move elements.
> Essentially it is
>      
>      enum SegmentedVec<T> {
>          Cons(Segment<T>, KBox<SegmentedVec<T>>)
>          Nul,
>      }
> 
>      struct Segment<T> {
>          elements: [T; 16]
>      }
> 
> or make the segments variable-sized and grow them accordingly.

That sounds a lot like the perfect application for XArray. :)
