Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ABE1AC88B;
	Thu, 26 Jun 2025 20:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750969883; cv=none; b=HUzfgusHXqRzZOR5vnLW/JZkpOoOj+wsetEY+IPubdT3OUgJaD3PTFx5SHF7jXce2FUPQEi+ASz/TV2O1gXyE39yXFhMZNvr+6EZNXAUfDpxAdexzXNuZOn/wfw7WO2YXQxmftwBzrnOcy/F0+2+s8pvyZ5Q+3yMjR/DZ/EgUlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750969883; c=relaxed/simple;
	bh=/7uLT/5QzU2c97p0dDWXOrLBhujNl00Oz5cNwO/D3YQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTgYlEGDnyaKxCWk/hLRc/HQvsF4JpIBxIyEB8Zka5Zdmnm/mPFKxSene+fg/PU/uO59t07Snyuo6rAPYiTE8yanKnRJV+kBGJXS6OLFUwmGzOdTnbpz62VfhpuXbMwzAycaFz12xA26QpGsS4bd4Kc+nFa2qJZoqbjJFw+DGCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwxpIKdK; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwxpIKdK"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b3c292bb4so12544151fa.1;
        Thu, 26 Jun 2025 13:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750969878; x=1751574678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRgtLChVcwC91XDcRTbMS+jnkMAGg5kUPg69daDLGww=;
        b=TwxpIKdKnchrAhtwfC7z6bORF+ZH1tgVDhmCAJAsO6W3E+Sx31vf9h3NM4wmmr2qIR
         36R1coKF3MhG+I+7cYMYxxDEOZhurWp4n/PtD9foHuHOaXezjaaAy4sFhjuIdUUbQPuZ
         o3qy2AgbT9ORYfid/N/6uKrUIePRdLjrpv0Q+jmE2YybakhSYyj7S0P7K1VeZAInqcTN
         JK6ezD2T6MkqFtb+E9yaH9OP6gWgVZoaEk88cOotjJcHFv6LMqr6mOdRRoJFksAVrU3Y
         6OSo1WUFqbSw/0HFhMQJfbmeJeP6tPsUdIKF4cyB1SuvB2Q+I9w9dX3k/35rDsgMF2Vc
         x1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750969878; x=1751574678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRgtLChVcwC91XDcRTbMS+jnkMAGg5kUPg69daDLGww=;
        b=B4dx0WzmPqKMAbNY/F5JrU9NKEAFYPyJe+xag/FOlI27vCGeJOgoRonWgWgaaunaOE
         QCd9h7YwLgcoQLFp+OERKwT5wmOmVlyeKa8baBd3NmvRF9t2GI8NrVVjkoi9yvhj51MJ
         UkgOfqxxGAwLqG8IYN5bxu4/TrZnK4y4BO3yuErE06njrcqMyQsom4CEq13iFRg5Agez
         E9TKjVuqu4yhQ7El2p0hASCKHzag1eMg4FG4Wiy+EAbPewywVr5KRPZVHNT8zYD2wvNg
         cFR3qxbN/XfwSLI8Pwg5BSTIHFKF4L5u3gPJU8+D1vW3U9MbjZEUmzhPURqbTMq+kCyv
         WvZg==
X-Forwarded-Encrypted: i=1; AJvYcCWEaXhK3sLIbSbUiHbnIDazzrZrg5Kcibgav+bvKm3JpFVy0TjjKDUqgJPmifzSyTHP185E49n5szbHGOk=@vger.kernel.org, AJvYcCWxPJua/HPbGT3hmVOIe9B5QQDCKFhf0mqc/NmMkbXrvWkvZ0yh2/DOnIJDlxzN7VWJF5PoatjxLEM0sQhFssM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb5RhAf1PqOoFCe4ZZc2oqg7rHnP6bhdQzf4yuvcmCDCPSKK/s
	1ax845NKnCI+YcD2PIDq6wAJqb3PvS/iTD4hma6CUrJOvxSI9r3Eh742
X-Gm-Gg: ASbGncuIOTCP82hRwWaw4te12OeZl8f4RW1J7PIZ7o3giikRyylS+smzh2/CNOO9vS4
	0AqnBCV1oa7QJ5TgTxtCXPK92DipiSe9qPYOE4N8wx+cvTLUpeiWIxdU9yeBH4StkoW0L+SZcTj
	9M15Eq+qeKdbi8VZeZm12uistd3KVnUcJG1MPOrhiKFDMdlxnqqn/oabtmlm52cGLRDL57XWflP
	XYKa3fGTStnrW7t9RBUNmGTf5x9rnNIal0xhnDx5dNZw/JXpeGLkjQDMemFcoespCr9TEYMKa+j
	wXv+zsGbFYwRFuHn8Ad3mGhIgOZjjW9thel/taRlrrLbr4eMuFbErNZkF1HWyN5WU30WWo2cMJb
	ULHc6a3yunH1TBek8fP+7kjmOdaenv7tKwlAWM78=
X-Google-Smtp-Source: AGHT+IHYfF74apNZsEVj5yD91rWsqIQcDDehaUjeuYFFZ6knoVUZVAJYhiRM9u8vG5icCh7X99mhpA==
X-Received: by 2002:a05:6512:31d0:b0:553:abcd:cf51 with SMTP id 2adb3069b0e04-5550ba16ad6mr269700e87.40.1750969878092;
        Thu, 26 Jun 2025 13:31:18 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ec5ef3sm3072181fa.60.2025.06.26.13.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 13:31:16 -0700 (PDT)
Message-ID: <e2677c26-1c25-4a34-b666-9dcfa9642fd1@gmail.com>
Date: Thu, 26 Jun 2025 23:31:15 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: add initial scatterlist bindings
To: Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: dakr@kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
 rust-for-linux@vger.kernel.org,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Petr Tesarik <petr@tesarici.cz>, Andrew Morton <akpm@linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Randy Dunlap <rdunlap@infradead.org>,
 Michael Kelley <mhklinux@outlook.com>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
 <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
 <20250529004550.GB192517@ziepe.ca> <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>
 <95ff963ddabf7c3cd2cfd07d0231a0073ff6847e.camel@redhat.com>
 <DAED5BUK7TUQ.4JRHFMWZ99W3@nvidia.com>
 <27e17dbf-df6a-48fc-a652-ad48a776f668@gmail.com>
 <DAENGORNRVZH.2KIGKFV5C5G3L@nvidia.com>
 <f787046921fd608c385dc5c559883c5d70839507.camel@redhat.com>
 <DAP96FEJ0XWT.PWYMIE8IJAVQ@nvidia.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <DAP96FEJ0XWT.PWYMIE8IJAVQ@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/06/2025 04:03, Alexandre Courbot wrote:
> Hi Lyude, sorry for taking so long to come back to this!
> 
> On Tue Jun 10, 2025 at 2:44 AM JST, Lyude Paul wrote:
>> On Thu, 2025-06-05 at 22:56 +0900, Alexandre Courbot wrote:
>>> On Thu Jun 5, 2025 at 10:30 PM JST, Abdiel Janulgue wrote:
>>>>
>>>>
>>>> On 05/06/2025 08:51, Alexandre Courbot wrote:
>>>>> Maybe I need more context to understand your problem, but the point of
>>>>> this design is precisely that it doesn't make any assumption about the
>>>>> memory layout - all `P` needs to do is provide the pages describing the
>>>>> memory backing.
>>>>>
>>>>> Assuming that `_owner` here is the owner of the memory, couldn't you
>>>>> flip your data layout and pass `_owner` (or rather a newtype wrapping
>>>>> it) to `SGTable`, thus removing the need for a custom type?
>>>>
>>>> I think what Lyude has in mind here (Lyude, correct me if I'm wrong) is
>>>> for cases where we need to have a rust SGTable instances for those
>>>> struct sg_table that we didn't allocate ourselves for instance in the
>>>> gem shmem bindings. So memory layout needs to match for
>>>> #[repr(transparent)] to work
>>>
>>> Thanks, I think I am starting to understand and this is a problem
>>> indeed. I should probably take a look at the DRM code to get my answers,
>>> but IIUC in `OwnedSGTable`, `sg_table` is already provided by the C side
>>> and is backed by `_owner`?
>>
>> Correct. You generally create a gem shmem object, and then you can call a
>> function to ask gem to create an sg_table and hand it back to you. I should
>> note my priorities have shifted a bit from trying to get shmem bindings
>> upstream, but currently it's still the best example I have of this usecase.
>>
>> So, for gem shmem this means we can operate with an SGTable in two ways:
>>
>>   * gem_shmem_object.sg_table() -> Result<&kernel::scatterlist::SGTable>
>>   * gem_shmem_object.owned_sg_table() ->
>>     Result<kernel::drm::gem::shmem::OwnedSGTable<T: DriverObject>
>>
>> I'm going to call the first return type SGTable and the second one
>> OwnedSGTable, just so I can type a bit less.
>>
>> The first, sg_table(), quite literally just calls drm_gem_shmem_get_pages_sgt
>> which attempts to allocate the table and return a pointer to it on success. We
>> then cast that to &SGTable and return it to the user. This can be good for
> 
> Mmm but if you cast the returned C pointer into a `&SGTable`, then who
> owns (and is responsible for freeing) the `SGTable` it refers to? If the
> pointer is just turned into a reference then this might leak the `struct
> sg_table`.
> 

Just commenting on this bit. From what I've seen, we don't actually leak 
anything. The cast only creates a reference to the original C `struct 
sg_table` object which was allocated and owned by whichever kernel 
subsystem called sg_alloc_table(). Rust doesn't even allow us to take 
ownership or to dereference the value, so this one is safe. Destructors 
are not called on those "casted" objects.

/Abdiel
