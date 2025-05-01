Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EF8C2ED
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 01:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746062329; cv=none; b=NiMJ2xUfPCXUA909IoKUV8ZjpuIw/l+EAN6ooZnJsjMUs29lGt+SoCdii2VLaxWvzU9w7Wl6XsZrsR/mSmpHxBi8FeMWg2o2ZwpHvgvdhY/DKlWev9/1uqix+QzxewByOioUWpgvz/IfegE3IlhOm+0vmxRgPcBvyR4RS/UrRrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746062329; c=relaxed/simple;
	bh=rG6iKEeoRQ6NI+R5qJVRftEdS5F8vFrCop/0Wg1lkSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5RLalJqSPUMOzyxY/FAMJlhQfnLnXhX54IZwvqId4WA2bhoauQlo54wow+jMC3uaKE4Mi5az7Oborf69qZYoYOwPTOGZa6KfITVOfWdWD+v3dUz2WF7DUgwnzaZEEZtxfo3XbPobAlw3HbyFczak68Arr7Dm3AABIQ52P2LTUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbfkZFaz; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbfkZFaz"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac7bd86f637so296280566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746062326; x=1746667126; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buwUSlS7iEVrH/m6Xzic7WPuufqccacCKhokCKCBl2w=;
        b=RbfkZFazAc4i9IO8+uBFSdbKw7wvlAQGaqKW5Lq2yxLmNOFzD0eT3ikWN2BzuAR+1D
         Qy4JIjP/Q6xxas7/K6Dk0/doJ5lezTYyrxZlNJnZZ9rKVjB/FjOb/9QUhf6ie35JLGS7
         Q8r3T5rM/3A+VLQssQdt0S/U4rif3TBB1btsF1c4JxW42hgpifxlKhhOB5NElGyFPJgW
         LHgi9VxritWmoCMJTlhy3edKfUSQknZQMFXNKPNqwzPHpaa7BrvaAy4lWCc/NNxce1yL
         Z3ZznO0oaWCkEtyulOLGzi0qd/O5+yAOR+68a7u0vqOZ4xBDEsbphCGRDaRqiQ0JiNnm
         iH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746062326; x=1746667126;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=buwUSlS7iEVrH/m6Xzic7WPuufqccacCKhokCKCBl2w=;
        b=frmcFfoH+rPNCzkynmsYMIySYOWymEDJIPSuxtXr3Cn/aK5EQ5033XAdyuBJpKCr3i
         vxDx1HNXeMCuDF0CLbtt3XDtpsFm1rTJEu124+J2fY4nYt6pvnSlm8lL69YVwPSx7E+A
         YsO1SSotjXARFmHRrdlXSH/IrP3YRFDqHpjM0GIP1/lufjYyMJjBwaL9zeJlQKYNJbDD
         Ot4Bc63mFFSHhwEG+49cbYgik7yon5EEmMb9X3tT/Q7Zl7VYhyxPGS+KuO05BsCxY/d6
         cnSi24ezY7bRUCh3cyod/DvwCUVT5oihuSmlLttE8XbDoYzr4CeWBU8mz34n650a72UY
         eVQA==
X-Forwarded-Encrypted: i=1; AJvYcCW+bAXwLmloAruwk790wcNsJxhzaZF+jnBT3ZGUO6k/lIBzuuAgjQWZDpHUuyO1mQYOZlSYfYtNskM1J38=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlzgG4Vq7HWyid75aRdIzYNBsCTMrChZjv2ML0oRUj26yi6RBO
	WPU1P6+OdZ+yC9Lhh7NYeWBxKA3mUBm+KgZ00x62pqgtOs3yVTdM
X-Gm-Gg: ASbGncsyjDRLvebANYe93jtcpfV8LlhoiTSJ60dryc2AnR3+FBqr92QcQE6C/37eOBl
	GyoMiy+Tr4ggroBxIEF302qt9hpljzWyQmtoPoJrsJJIvYmJ/zyyns+DQxrEdamSpQ0TQYX+N7Z
	ef2yr6GxAHvl1kIbn7u/+/ZYrqRV7KO1HVVJq0BaLgT8HbAipVkGQZiKkz+Ntk3jY+GnORcBPme
	eLFFi3pd72u9hS1AHAupGvBXAVatWu6JEr5pA76ewfj0fXCbu7ohOM+Df9CrUzxuQyPajQagE9n
	/jTsQwEthKPSLUfwBeEQ8j3wZtJZ3OLD/Y4rYNNLHDv0mzvu6iQ=
X-Google-Smtp-Source: AGHT+IHQdFsCgwAedDrVKruzmw1YWcu3XgOYfrqpDjIFjH+NnJt/gdX6kuCX5txwMnFkkN3KXxmypA==
X-Received: by 2002:a17:906:7092:b0:ac7:81b0:62c9 with SMTP id a640c23a62f3a-aceff3c3c61mr33880766b.20.1746062326124;
        Wed, 30 Apr 2025 18:18:46 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafec7sm988202666b.165.2025.04.30.18.18.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Apr 2025 18:18:45 -0700 (PDT)
Date: Thu, 1 May 2025 01:18:45 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Wei Yang <richard.weiyang@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/10] mm/mremap: introduce more mergeable mremap
 via MREMAP_RELOCATE_ANON
Message-ID: <20250501011845.ktbfgymor4oz5sok@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
 <87e668d54927bb4ccdb7d374275e0662de667697.1745307301.git.lorenzo.stoakes@oracle.com>
 <20250430004703.63rumj4znewlbc2h@master>
 <8c052822-5365-4178-8e06-ecd4f917cf8a@lucifer.local>
 <20250430154119.a5ljf5t5tutqzim5@master>
 <ae3717ca-42e7-49a6-99f9-73a4c0be70f9@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae3717ca-42e7-49a6-99f9-73a4c0be70f9@lucifer.local>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Apr 30, 2025 at 05:07:40PM +0100, Lorenzo Stoakes wrote:
>On Wed, Apr 30, 2025 at 03:41:19PM +0000, Wei Yang wrote:
>> On Wed, Apr 30, 2025 at 02:15:24PM +0100, Lorenzo Stoakes wrote:
>> >On Wed, Apr 30, 2025 at 12:47:03AM +0000, Wei Yang wrote:
>> >> On Tue, Apr 22, 2025 at 09:09:20AM +0100, Lorenzo Stoakes wrote:
>> >> [...]
>> >> >+bool vma_had_uncowed_children(struct vm_area_struct *vma)
>> >> >+{
>> >> >+	struct anon_vma *anon_vma = vma ? vma->anon_vma : NULL;
>> >> >+	bool ret;
>> >> >+
>> >> >+	if (!anon_vma)
>> >> >+		return false;
>> >> >+
>> >> >+	/*
>> >> >+	 * If we're mmap locked then there's no way for this count to change, as
>> >> >+	 * any such change would require this lock not be held.
>> >> >+	 */
>> >> >+	if (rwsem_is_locked(&vma->vm_mm->mmap_lock))
>> >> >+		return anon_vma->num_children > 1;
>> >>
>> >> Hi, Lorenzo
>> >>
>> >> May I have a question here?
>> >
>> >Just ask the question.
>> >
>>
>> Thanks.
>>
>> My question is the function is expected to return true, if we have forked a
>> vma from this one, right?
>>
>> IMO there are cases when it has one forked child and anon_vma->num_children == 1,
>> which means folios are not exclusively mapped. But the function would return
>> false.
>>
>> Or maybe I misunderstand the logic here.
>
>I mean, it'd be helpful if you delineated which cases these were?
>

Sorry, I should be more specific.

>Presumably you're thiking of something like:
>
>1. Process 1: VMA A is established. num_children == 1 (self-reference is counted).
>2. Process 2: Process 1 forks, VMA B references A, a->num_children++
>3. Process 3: Process 2 forks, VMA C is established (maybe you think b->num_children++?)

Maybe this is the key point. Will explain below at ***.

>4. Unmap vma B, oops, a->num_children == 1 but it still has C!
>
>But that won't happen, as VMA C will be referencing a->anon_vma, so in reality
>a->anon_vma->num_children == 3, then after unmap == 2.
>

The case here could be handled well, I am thinking a little different one.

Here is the case I am thinking about. If my understanding is wrong, please
correct me.

	a                  VMA A
	+-----------+      +-----------+
	|           | ---> |         av| == a
	+-----------+      +-----------+
	             \
	              \
	              |\   VMA B
	              | \  +-----------+
	              |  > |         av| == b
	              |    +-----------+
	              \
	               \   VMA C
	                \  +-----------+
	                 > |         av| == c
	                   +-----------+

1. Process 1: VMA A is established, num_children == 1
2. Process 2: Process 1 forks, a->num_children++ and b->num_children == 0
3. Process 3: Process 2 forks, b->num_children++ => b->number_children == 1

If vma_had_uncowed_children(VMA B), we would check b->number_children and
return false since it is not greater than 1. But we do have a child process 3.

***

Come back the b->num_children. After re-read your example, I guess this is the
key point. In anon_vma_fork(), we do anon_vma->parent->num_children++. So when
fork VMA C, we increase b->num_children instead of a->num_children.

To verify this, I did a quick test in my test cases in
test_fork_grand_child[1]. I see b->num_children is increased to 1 after C is
forked. Will reply in that thread and hope that would be helpful to
communicate the case.

Well, if I am not correct, feel free to correct me :-)

[1]: http://lkml.kernel.org/r/20250429090639.784-3-richard.weiyang@gmail.com

>References to the originally faulted-in anon_vma is propagated through the
>forks.
>
>anon_vma logic is tricky, one of many reasons I want to (significantly) rework
>it.
>
>Though sadly there is a lot of _essential_ complexity, I do think we can do
>better.
>

-- 
Wei Yang
Help you, Help me
