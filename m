Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553DB77111
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455835; cv=none; b=Vrq64Ob+ifXYJ0VN0PIzO38JJgJ8CMiBlRew0pUeXDwgRXbnaBFKWZzFWlSyOKcID3suk2Xi48ZJdifXa47acWb4RwdN0VpSJSSCLuu8rDUqIGTLgcR7Nv3dCPgtCcbuLR164HwvnYh+lvU85sBybh5EAUFYjtmYnf/3DiTteYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455835; c=relaxed/simple;
	bh=rf/GLDMiPyGo475BkxDtKs+YUaTTeEwLzWFM3PNQk4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=peyq8f90CRhkteLCW75uNB3AA7KdrLIGTJIw9K/NPIAb5iLi9NR+/OlucQ/N0LHHvwWydaB1qgR5zTRJjXUFbuEyLD1eI+pWn+r7RtDUFFS8GY+UxTyEDW6c40ew60COPK5aDtchDYIHjgwiDVtY8hsKiYLCqVLBwWf9OQ8I+Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJD9taOl; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJD9taOl"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bec442a25so3607971fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 07:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746455831; x=1747060631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1NHcDk4r4MC4EBq9o/mXd6iYMNAbw2nwb2cXbhASKss=;
        b=bJD9taOlLOO888Kqmuc/WtXP75jrjd9lNBJxaqfhT0xmuHy/SvzpMzpUUgUSCo8JK4
         QbiG0pyPkY4cQJO6ErRxcli3s7b63xnlp/olDTGNkshJVXiJr46nM+4ITVqiMWMb1GgR
         S4LakUg3jo2hbkdnys1dbq6CmtwDOMbeMBQauM0pHB2fw5pmXZiy7K64TG0CZHc7jmbw
         eShtvbslQ51j9Rcm5qhjPPY3dz3goO9/HDyU5I6I0WiCopoDJWwCndBCLT102ezlo4hd
         LOW1Q+uUwQPvXGXZJAjBrTPlW5JthZT27kNUcew2cEM1mpHlzUM30ZDGCJJBK74BMGFy
         csdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455831; x=1747060631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1NHcDk4r4MC4EBq9o/mXd6iYMNAbw2nwb2cXbhASKss=;
        b=wAsSATfQ/8FEc3ES78kEJQCJ0rVntmyvfb+jekG3ZipE7a5qB9pH26xCtgC013qHwW
         rPElY+Ak6Uj/UKZ5+in0UyqL9K7HzZCnyf0dhr2lHuaiwt3QvrFoNeq7/WQSeqhWWa59
         DwkQVoRkrOJO9yPJHDZjBGU/Qr7UP3nh/GGmkr27db2+r9vgWeBSKkJ9YSFexrK2sgcC
         7sHvDc2gdp42yp+/DbXoFlvZucm1LPmaQQ0LLbAsFX01O1PI/KvO8iNrPaC8geas6HNJ
         dMoOBu1tukgGNL/dSYJ1THD0povgzhRu8oo+ifTNbY/Nw7QGWddXPbwwm74zAKZqz0Jy
         YA6w==
X-Gm-Message-State: AOJu0YzwNrlTSr34v70JTBMu3RgT3otVF8OTL90gQXUf4fG2pocKUOew
	zqfVSlpIcNs9VzQrjgEZZv0fvHDEOp8hyYVETosqW9DgmEqbmn35
X-Gm-Gg: ASbGncvd4zgKbPU7gTeQT2WCn8p4KPI6RxBgM832+Tw8aP1CyO1+F/fUSeok+Z2gsAC
	J+a9oiiGusptfivvbSswNE67rMQxppTsAjVql2JIFYKwMfSTSHnqwenW+yR5mzV9qMjB/eHeA9N
	20KWkPB71148MA+zt32kDW2cfxjdjy9zVIYGEC30+mT0O2ho7u82gcneXyR9Rkwz1QDpQFKIv+7
	QGZHOwF26693W/acpzBthnjsbWHZbC3reA8vOx7iw2LBlWijL1WBskQgSZRkBfBhkjZipEEmlBA
	vAr6nqe/cNFcDUVJPzSQnw/1dXesDyUcUWavlsWKe7+oqEjXbxjrik8uGw==
X-Google-Smtp-Source: AGHT+IGEtTrk5xxPxYLHFQLp2mHEJ3luWELdgPGmJBEEinUSHAR9t94mHQ/40kEYFTJUGu32Rm+2eQ==
X-Received: by 2002:a2e:be8d:0:b0:30b:b852:2f5d with SMTP id 38308e7fff4ca-320c63b8d9amr12492721fa.11.1746455830940;
        Mon, 05 May 2025 07:37:10 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202ad908b9sm16303971fa.108.2025.05.05.07.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 07:37:10 -0700 (PDT)
Message-ID: <b9a80cff-8315-4be9-9a01-3c618b00d3e9@gmail.com>
Date: Mon, 5 May 2025 16:35:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] KSTATE: a mechanism to migrate some part of the
 kernel state across kexec
To: Chris Li <chrisl@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>,
 James Gowans <jgowans@amazon.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Eric Biederman <ebiederm@xmission.com>, kexec@lists.infradead.org,
 Pratyush Yadav <ptyadav@amazon.de>, Jason Gunthorpe <jgg@nvidia.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Rientjes <rientjes@google.com>
References: <20250310120318.2124-1-arbn@yandex-team.com>
 <CAF8kJuMmiBEoaAL=XYcj6Y1qfAVd=Q_s9iT0wi70LJYn6ht42w@mail.gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <CAF8kJuMmiBEoaAL=XYcj6Y1qfAVd=Q_s9iT0wi70LJYn6ht42w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/29/25 1:01 AM, Chris Li wrote:
> Hi Andrey,
> 
> I am working on the PCI portion of the live update and looking at
> using KSTATE as an alternative to the FDT. Here are some high level
> feedbacks.
> 

Hi, thanks  a lot.

> On Mon, Mar 10, 2025 at 5:04 AM Andrey Ryabinin <arbn@yandex-team.com> wrote:
>>
>>  Main changes from v1 [1]:
>>   - Get rid of abusing crashkernel and implent proper way to pass memory to new kernel
>>   - Lots of misc cleanups/refactorings.
>>
>> kstate (kernel state) is a mechanism to describe internal some part of the
>> kernel state, save it into the memory and restore the state after kexec
>> in the new kernel.
>>
>> The end goal here and the main use case for this is to be able to
>> update host kernel under VMs with VFIO pass-through devices running
>> on that host. Since we are pretty far from that end goal yet, this
>> only establishes some basic infrastructure to describe and migrate complex
>> in-kernel states.
>>
>> The idea behind KSTATE resembles QEMU's migration framework [1], which
>> solves quite similar problem - migrate state of VM/emulated devices
>> across different versions of QEMU.
>>
>> This is an altenative to Kexec Hand Over (KHO [3]).
>>
>> So, why not KHO?
>>
> 
> KHO does more than just serializing/unserializing. It also has scratch
> areas etc to allow safely performing early allocation without stepping
> on the preserved memory. I see KSTATE as an alternative to libFDT as
> ways of serializing the preserved memory. Not a replacement for KHO.
> 
> With that, it would be great to see a KSTATE build on top of the
> current version of KHO. The V6 version of KHO uses a recursive FDT
> object. I see recursive FDT can map to the C struct description
> similar to the KSTATE field description nicely. However, that will
> require KSTATE to make some considerable changes to embrace the KHO
> v6. For example, the KSTATE uses one contiguous stream buffer and KHO
> V6 uses many recursive physical address object pointers for different
> objects.  Maybe a KSTATE V3?
> 

Yep, I'll take a look into combinig KSTATE with KHO.

....

> 
>>      a_kho_restore()
>>      {
>>              ...
>>              a.i = fdt_getprop(fdt, offset, "i", &len);
>>              if (!a.i || len != sizeof(a.i))
>>                 goto err
>>              *a.p_ulong = fdt_getprop....
>>      }
>>
>>     Each driver/subsystem has to solve this problem in their own way.
>>     Also if we use fdt properties for individual fields, that might be wastefull
>>     in terms of used memory, as these properties use strings as keys.
> 
> Right, I need to write a lot of boilerplate code to do the per
> property save/restore. I am not worried too much about memory usage. A
> lot of string keys are not much longer than 8 bytes. The memory saving
> convert to binary index is not huge. I actually would suggest adding
> the string version of the field name to the description table, so that
> we can dump the state in KSTATE just like the YAML FDT output for
> debugging purposes. It is a very useful feature of FDT to dump the
> current saving state into a human readable form. KSTATE can have the
> same feature added.
> 

kstate_field already have string with name of the field:

#define KSTATE_BASE_TYPE(_f, _state, _type) {		\
	.name = (__stringify(_f)),			\

Currently it's not used in code, but it's there for debug purposes 


>>    While with KSTATE solves the same problem in more elegant way, with this:
>>         struct kstate_description a_state = {
>>                 .name = "a_struct",
>>                 .version_id = 1,
>>                 .id = KSTATE_TEST_ID,
>>                 .state_list = LIST_HEAD_INIT(test_state.state_list),
>>                 .fields = (const struct kstate_field[]) {
>>                         KSTATE_BASE_TYPE(i, struct a, int),
>>                         KSTATE_BASE_TYPE(s, struct a, char [10]),
>>                         KSTATE_POINTER(p_ulong, struct a),
>>                         KSTATE_PAGE(page, struct a),
>>                         KSTATE_END_OF_LIST()
>>                 },
>>         };
>>
>>
>>         {
>>                 static unsigned long ulong
>>                 static struct a a_data = { .p_ulong = &ulong };
>>
>>                 kstate_register(&test_state, &a_data);
>>         }
>>
>>        The driver needs only to have a proper 'kstate_description' and call kstate_register()
>>        to save/restore a_data.
>>        Basically 'struct kstate_description' provides instructions how to save/restore 'struct a'.
>>        And kstate_register() does all this save/restore stuff under the hood.
> 
> It seems the KSTATE uses one contiguous stream and the object has to
> be loaded in the order it was saved. For the PCI code, the PCI device
> scanning and probing might cause the device load out of the order of
> saving. (The PCI probing is actually the reverse order of saving).
> This kstate_register() might pose restrictions on the restore order.
> PCI will need to look up and find the device state based on the PCI
> device ID. Other subsystems will likely have the requirement to look
> up their own saved state as well.
> I also see KSTATE can be extended to support that.
> 

Absolutely agreed. I think we need to decouple restore and register, ie remove
 restore_misgrate_state() from kstate_register(). Add instance_id argument to kstate_register(),
so the PCI code could do:
            kstate_register(&pci_state, pdev, PCI_DEVID(pdev->bus->number, pdev->devfn));

And on probing stage (probably in pci_device_add()) call
        kstate_restore(&pci_state, dev, PCI_DEVID(bus->number, dev->devfn))

which would locate state for the device if any and restore it.


>>  - Another bonus point - kstate can preserve migratable memory, which is required
>>     to preserve guest memory
>>
>>
>> So now to the part how this works.
>>
>> State of kernel data (usually it's some struct) is described by the
>> 'struct kstate_description' containing the array of individual
>> fields descpriptions - 'struct kstate_field'. Each field
>> has set of bits in ->flags which instructs how to save/restore
>> a certain field of the struct. E.g.:
>>   - KS_BASE_TYPE flag tells that field can be just copied by value,
>>
>>   - KS_POINTER means that the struct member is a pointer to the actual
>>      data, so it needs to be dereference before saving/restoring data
>>      to/from kstate data steam.
>>
>>   - KS_STRUCT - contains another struct,  field->ksd must point to
>>       another 'struct kstate_dscription'
> 
> The field can't have both bits set for KS_BASE_TYPE and KS_STRUCT
> type, right? Some of these flag combinations do not make sense. This
> part might need more careful planning to keep it simple. Maybe some of
> the flags bits should be enum.
> 

Yes, this needs more thought. Mutually exclusive flags could be moved in separate enum field.
 Some may be not needed at all. e.g. instead of KS_STRUCT we could just check if (field->ksd != NULL)


>>
>>   - KS_CUSTOM - Some non-trivial field that requires custom kstate_field->save()
>>                ->restore() callbacks to save/restore data.
>>
>>   - KS_ARRAY_OF_POINTER - array of pointers, the size of array determined by the
>>                          field->count() callback
>>   - KS_ADDRESS - field is a pointer to either vmemmap area (struct page) or
>>      linear address. Store offset
> 
> I think we want to describe different stream types.
> For example the most simple stream container is just a contiguous
> buffer with start address and size.
> The more complex one might be and size then an array of page pointers,
> all those pointers add to up the new buffer which describe an saved
> KSTATE that is larger than 4K and spread into an array of pages. Those
> pages don't need to be contiguous. Such a page array buffer stores the
> KSTATE entry described by a separate description table.
> 

Agreed, I had similar thoughts. But this complicates code, so I started with
something simple.

>>
>>   - KS_END - special flag indicating the end of migration stream data.
>>
>> kstate_register() call accepts kstate_description along with an instance
>> of an object and registers it in the global 'states' list.
>>
>> During kexec reboot phase we go through the list of 'kstate_description's
>> and each instance of kstate_description forms the 'struct kstate_entry'
>> which save into the kstate's data stream.
>>
>> The 'kstate_entry' contains information like ID of kstate_description, version
>> of it, size of migration data and the data itself. The ->data is formed in
>> accordance to the kstate_field's of the corresponding kstate_description.
> 
> The version for the kstate_description might not be enough. The
> version works if there is a linear history. Here we are likely to have
> different vendors add their own extension to the device state saving.

I think vendors can just declare separate kstate_description with different ID.
The only problem with this, is that kstate_description.id is integer, so it would be
a problem to allocate those without conflicts.
Perhaps change the id to string? So vendors can just add vendor prefix to ID.


> I suggest instead we save the old kernel's kstate_description table
> (once per description table as a recursive object)  alongside the
> object physical address as well. The new kernel has their new version
> of the description table. It can compare between the old and new
> description tables and find out what fields need to be upgraded or
> downgraded. The new kernel will use the old kstate_description table
> to decode the previous kernel's saved object.

Hmm.. I'm not sure, there is a lot to think about.
 This might make changes in kstate_description painful,
e.g. if I want to rearrange some ->flags for whatever reason.
So how to deal with changes in kstate_description itself?

How do we save links to methods in kstate_field (->restore/->save/->count),
and what if we'll need to change function prototypes of these methods ?


> I think that way it is> more flexible to support adding one or more features and not tight to
> which version has what feature. It can also make sure the new kernel
> can always dump the old KSTATE into YAML.
> 
> That way we might be able to simplify the subsection and the
> depreciation flags. The new kernel doesn't need to carry the history
> of changes made to the old description table.
> 
>> After the reboot, when the kstate_register() called it parses migration
>> stream, finds the appropriate 'kstate_entry' and restores the contents of
>> the object in accordance with kstate_description and ->fields.
> 
> Again this restoring can happen in a different order when the PCI
> device scanning and probing order. The restoration might not happen in
> one single call chain. Material for V3?

Agreed.

> I am happy to work with you to get KSTATE working with the existing KHO effort.
> 
Thanks for useful feedback, appreciated.
