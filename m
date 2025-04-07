Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E98224FD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027792; cv=none; b=X4WE78IsgUGo3Ft3J9gffke+PshJAJrXwwokR8IEnMrWMRwjJTTF6YYSvRSmALT1ILlN29zSgRrAlH+AnolnxtJNKWE301kZg/Ha4IhseF7G+mGwTpGBeiVCI24m88fsefUQg6+GcfZ7kSIAQ9TxoZptUMTKkKUH/SlU19NtaWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027792; c=relaxed/simple;
	bh=e44SiL3bvklsDrt1HjaQIZmPJ2dv984wWJrVwVr43XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+DrDazE6IePQUL66mIm76XXlpsMfeD3QgAbgyFS0VI3Dfs+Mw3omkWSUK0ArvHzCkDKUr5PVU7s95lfznoXdNPOWrQJin3ZughZi9GK8EiTTuLPr8y13n0dx1wMfFoRRDC9nz2yeL2pLCjB5ntPc6ccPmhK+XYkHD0TXLr2Fmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqrCjnzW; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqrCjnzW"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so7298844a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 05:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744027789; x=1744632589; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enARi2Z7JnPTEmDCNXEY7n8qxxK9DglFVB+3z5zSkI0=;
        b=MqrCjnzWuIA3k3IMVpU04YS6JGOaEgkT45/nByZmz6I5+BPvQLJH6VeDgYXIqrTTNC
         ircBSoaEx8KOrDUQA+wsgnSxskDspk5i9HYCBhB9TjV0ZMM6EvfnQgv0MKnGTCTt0s8Y
         dfXARSnYEFeLBQZjpp+C6qXUrpbVBP3JtxFpBJOk0wdUuNmVvjdlLXmSVx/qeddIlp7R
         KmtO1Yda2S1SlmCzi+cgBIV85bRKAuCC8zDeg5RKb/2QL8opzSYRAA/Li2nPXDyZWcjO
         0oWtZ89E1OFxtENwIsrIVIynedQDDLjHRlGlmBXGuiiBnvSTkBp7/R68w21FiJkNJuCp
         XI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027789; x=1744632589;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=enARi2Z7JnPTEmDCNXEY7n8qxxK9DglFVB+3z5zSkI0=;
        b=jIgTEcBmaDXjd2fDDOhAzcbFZAbRqaWfieKxJIh9Ds59pRYW13ZbfPLzlA6NR97v4K
         qY4unsd1pf0jWtwKnXzNeszq+hneR9e8JafE+tFCO1xdotDzcztthy1G4cNrQRjQVVIn
         jYzy+41+2bwH3V1ZXmrbeL+anvVargY4LDHmNxL1WS7ChysNnv88MhMaMnWfCW4xJ+nn
         GqkMX6TsektsKLkR5RmMeW/3EbC3COLVtcz8mmcVNyFJPkXXBvPWa1aHaxWDgBC4btwj
         2WOf6LOqjcrHchaLAXLGfnnc1kazdIa0HEKgsPrGm2anhMpfrvA/yXMegW7rhXwpzO9l
         fIQw==
X-Forwarded-Encrypted: i=1; AJvYcCVYfPe47xRXP+xp2srlb+hD9KPkCfUlYPEWO9OSisrpIaJOSKVh1jikT8jjarrrAFMc07EhoJfH3jfp2UE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeLLUs5IpZKiG8yP19XSi/m/+xY4wXEDW7Zw/nkpuHb4lduElF
	t0s96VYac16MtMoupwjlAHpjqtKBrvtQ1jByc1Lde6glH85vwiGf
X-Gm-Gg: ASbGncsLs0ahfDe5ldHvs1g0xv3JdHJCvIgrZSOtigHXapjDNs+VrVdcznAi92zXiZD
	W+yQHi+zQkb9bDXYhIgPYkyjCpR2AOPaBjrFhJ1h+bp05G78/sj8verDkamhfCIcmpZoGTaVPcF
	Gy2MnKasA1wEW8bdF7O1Qkhq8uIuz8wdYiEzEaJduAI4NHJ9tHjT64PzSUOw2fIOaBYiLGRjA2Y
	D9cBrFtj+/UA7DPjiX3NEM2GMg7r1adRq6cHxTD3d5Lu1h9dzOgS4xKxzdqNOR3uzk3tIsNSdWr
	kwABQpjzRG7IgIKTyvbtDjxAFyWKXyIJ+tCzSZ8Vk/z43nT/8mhW5Vo=
X-Google-Smtp-Source: AGHT+IGn0rEfvulogO9nsHA48Cij7KYVKJkS78aPH6qE6hVJ5Z+++CiiVGjuZNBfsfI6Ibw6sqznyQ==
X-Received: by 2002:a17:907:6e88:b0:ac6:fe8c:e7bb with SMTP id a640c23a62f3a-ac7d1c66170mr1253923566b.55.1744027788976;
        Mon, 07 Apr 2025 05:09:48 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9adc6sm740717766b.59.2025.04.07.05.09.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Apr 2025 05:09:48 -0700 (PDT)
Date: Mon, 7 Apr 2025 12:09:48 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Wei Yang <richard.weiyang@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] tools/testing/selftests: assert that anon merge
 cases behave as expected
Message-ID: <20250407120948.zb5th45e6ehxpmrm@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1742245056.git.lorenzo.stoakes@oracle.com>
 <e9e016392b6ceb5c58a868439fd7039e31bfda18.1742245056.git.lorenzo.stoakes@oracle.com>
 <20250407025455.67nhchndedotn57g@master>
 <4a8a1163-a7f9-4368-98e1-f79b0411aac4@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a8a1163-a7f9-4368-98e1-f79b0411aac4@lucifer.local>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Apr 07, 2025 at 12:02:00PM +0100, Lorenzo Stoakes wrote:
>I know you mean well Wei,
>
>But drive-by extremely pedantic review on minor details isn't really
>useful. I can't tell you not to do this, but I can at least ask. I don't
>think this is a great use of either of our time.
>
>Thanks.
>
[...]
>> >+
>> >+	/* unCOWing everything does not cause the AVC to go away. */
>>            ^^^
>>
>> Before ptr[i] = 'x', we have unCOWed pages in vma. What we are doing here is
>> COWing, right?
>
>Nope, it's the other way round, as commented. A 'CoW' page is one marked
>for copy-on-write right? we now make it just a normal mapping by writing to
>it.
>

Oh, I misunderstand the meaning of 'CoW' page. It is the page before copy. I
thought it is the page after. Sorry for bothering.

>>
>> >+	for (i = 0; i < 5 * page_size; i += page_size)
>> >+		ptr[i] = 'x';
>> >+
>> >+	/*
>> >+	 * Map in adjacent VMA in child.
>> >+	 *
>> >+	 *     forked
>> >+	 * |-----------|-----------|
>> >+	 * |  faulted  | unfaulted |
>> >+	 * |-----------|-----------|
>> >+	 *      ptr         ptr2
>> >+	 */
>> >+	ptr2 = mmap(&ptr[5 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
>> >+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
>> >+	ASSERT_NE(ptr2, MAP_FAILED);
>> >+
>> >+	/* Make sure not merged. */
>> >+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
>> >+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
>> >+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 5 * page_size);
>> >+}
>> >+
>> >+TEST_F(merge, forked_source_vma)
>> >+{
>> >+	unsigned int page_size = self->page_size;
>> >+	char *carveout = self->carveout;
>> >+	struct procmap_fd *procmap = &self->procmap;
>> >+	pid_t pid;
>> >+	char *ptr, *ptr2;
>> >+	int i;
>> >+
>> >+	/*
>> >+	 * |............|-----------|
>> >+	 * | <unmapped> | unfaulted |
>> >+	 * |............|-----------|
>>
>> I am not sure "unmapped" is correct here. The range has already been mapped by
>> FIXTURE_SETUP(merge).
>
>This is pointless and actually misleading pedantry.
>
>For the purposes of what we are doing here, this is unmapped. Do you truly
>think mentioning a PROT_NONE mapping here would be useful, meaningful, or
>add anything but noise?
>
>>
>> >+	 */
>> >+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
>> >+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED | MAP_NORESERVE, -1, 0);
>> >+	ASSERT_NE(ptr, MAP_FAILED);
>> >+
>> >+	/*
>> >+	 * Fault in process.
>> >+	 *
>> >+	 * |............||-----------|
>> >+	 * | <unmapped> ||  faulted  |
>> >+	 * |............||-----------|
>>                          ^
>>
>> Extra line here?
>
>Eh? I don't understand what you mean... you mean an extra '-'? This is to
>fit both unfaulted/faulted in the same size SACII 'VMA', a convention I've
>kept (hopefully) consistently...
>

Sounds the character format is corrupted.

The extra line I meant is "||" between unmapped and faulted area. Well it is
trivial, just forget it.

-- 
Wei Yang
Help you, Help me
