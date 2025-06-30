Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6D328D8E4;
	Mon, 30 Jun 2025 17:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751305189; cv=none; b=PKIQkobRlCJoooRfXqbQBoTqRG5q1Yxd7xn5SaYKn8tKBMvZSVIDDKT8EeHdkpsJrnQrtfYqtGPtTGGAA3YsbYxaNeLceQl4aNXv68TyLbleZeftoJnxZJBVtJoxN9cQmmdwwjdKeUDKFXa04Is+4LQy22i5EV5Baovs+fq/iyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751305189; c=relaxed/simple;
	bh=YOCZJHaTYhSU9iDXyLucBLNmy80NB1Sv0zz4GcryGxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nO43LUN0Uxq11dPowsz5/amlt7bUREeeT4tCmjw3Aj/2cMWuGS9R6sE1iRceB5RJ7Wo4tXmdhJ3JvTmtEO4/Z52SC/Y6CLo+5Tchrh5TyacBmw4lHys8KiWD2u03B/88UOlQBZRs5AYmef08LkjGkUXHZqX3R4yTSq+OC1hnkcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eeC1ExrT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eeC1ExrT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5D2C4CEEF;
	Mon, 30 Jun 2025 17:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751305188;
	bh=YOCZJHaTYhSU9iDXyLucBLNmy80NB1Sv0zz4GcryGxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eeC1ExrT57cAs6HaSKOQ59T9YTnFv+eB5sEDaR4zbA1NgnvzaUfFjyWb/6cFlklS2
	 es+KAU/Q/5w+H9IinGYWSNRCYlSLkTOpTdOS2mlWzXpAHVzkYZmGpxTXMJoacZGLwq
	 D3AGIipF1xY/WT+yxSJPg8A1WTqwkTT4pSvFznondZGaLcAKJ9Y2RjdMj1b9IODEo0
	 3JDjf84xSD88Rq9Ta0ClZ8ZGsj4dEW0i1Gt4mVz5uCM1zpFInKho1rwE6+hbPILsvY
	 6X0cIJAxqm+Uj4falwtzvo1j4KuNRmn2LfcVW+emEPIeH93an9ovaoDR1MRCpb54Rr
	 PEaFV3HZ4hreA==
Message-ID: <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org>
Date: Mon, 30 Jun 2025 19:39:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing for
 File
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>,
 Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-4-c6526e413d40@google.com>
 <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
 <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/30/25 7:34 PM, Matthew Maurer wrote:
> On Mon, Jun 30, 2025 at 10:30 AM Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> On 6/28/25 1:18 AM, Matthew Maurer wrote:
>>> +    fn create_file<D: ForeignOwnable>(&self, _name: &CStr, data: D) -> File
>>> +    where
>>> +        for<'a> D::Borrowed<'a>: Display,
>>> +    {
>>> +        File {
>>> +            _foreign: ForeignHolder::new(data),
>>> +        }
>>>        }
>>
>> What's the motivation for the ForeignHolder abstraction? Why not just make it
>> File<D> and store data directly?
> 
> 1. A `File<D>` can't be held in collection data structures as easily
> unless all your files contain the *same* backing type.

That sounds reasonable.

> 2. None of the APIs or potential APIs for `File` care about which type
> it's wrapping, nor are they supposed to. If nothing you can do with a
> `File` is different depending on the backing type, making it
> polymorphic is just needlessly confusing.

What if I want to access file.data() and do something with the data? Then I'd
necessarily need to put my data in an Arc and reference count it to still be
able to access it.

That doesn't seem like a reasonable requirement to be able to access data
exposed via debugfs.
