Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2685BBA36
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745974027; cv=none; b=f5Ih+0TgEf6kGzsPhtwyUgABvaBs2lhZpzw2ac1FDwr5A7N89jYwm2EgmiqeuAOSH4zthCplyXBFyZeH2Skaq9hBvW/U3G9z8Cx5BnZ5V6+wwya+jlU6KfRXw30YM3cj5pIq0wutJ+xawgoz1TgqBvxPYjB4XvLDRKCxVRFGOlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745974027; c=relaxed/simple;
	bh=awP8RcU28LT0u/SvRYmTUFMQAt23uf+n/WFqMuA3lVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCG7haQnklZtFA1y9bm0ho81oxYqHqvHcQcyjjTMqgo9BsJliq2nDDKTZXBNUuBeORkFjIu5Obq7o77LiGyS2/ivcwKbrUOCwno1AwocDzMk/T4UBphx3AFuho0IJU8lmH1ONcWwyZzLoDwavbdoipRPGfE/VqoB4Q9yd2Poo2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUWIHbrv; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUWIHbrv"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so1308648966b.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745974024; x=1746578824; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSgadnBmFdrxH2lG8ysxhENfLPEy41WjvEBPxZFhovg=;
        b=IUWIHbrvehW0YYP12ZRqpWMIVZIBRu+8qdC0U36U0FDbnXx6X/bNGAlyT0pouqJAc0
         1Ljnppmnh0fz4dAjomH2EKMXRv+nr5qvorobG2g5qpHuluSXkoqZ7Ws2N+eNw5CKx6CY
         TeNNOiPaqFif9XKaX0lkTfdNhWyrxnCcp7Oj5c42gDUVTQ1CQu3GA+hJSUWj2Uo9n8mq
         h9F+5mXo7t8CPbymsftH+osrJAv+FLlaXhpGXg15BOKrURlhCFz8nfV5lcjkAo3PkYfG
         WhqWmPaNNcJeCPw/P+E68A1wCP8XmTXMu4X23VQ5Qnycp35yqYFd5U1cMbxt8/idvu+c
         rHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974024; x=1746578824;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NSgadnBmFdrxH2lG8ysxhENfLPEy41WjvEBPxZFhovg=;
        b=KFN94DK2HEvqpDC6ecJHu+SThrG+yjdX4SmWf3WKOzUfYU5TPrFNSKBpG8QxHqOW15
         t+zx8wNb1WfLWuaZyNR+TCSO/LENVlAwzK0+gx8nUrKfIy8mDr8yRCdayD8aeVUkHOSZ
         +jSVZSJbK6qWAuauKehQ8ZFbKIZgKpS1vkKlefDp11Sbam1eL+Zza8vtmKLcXZjebFnK
         TAa1QgxEl3iVLXU+wh1tN3Zs7ocetEfM2kzqWID1UpNaGci0GLgCe/IoDf3nL+bTJAW3
         lB8Ll/kHFezWbmdJ6pa+7oZr6fG7+r/7PuBlbBIyygHDEuFogZ5kKJGvzGpfRYuWNTR8
         xANQ==
X-Forwarded-Encrypted: i=1; AJvYcCXggF5HJjhiZ1hCS8CHkJ34SAG6qPbWMh7FoeM4CQLEUq3rtxUaLB/zB+GCx/g4LTBGBsF17o0Y42QSxI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLy4+OESuO83s3v6VFtLqigChA9QXtvAPfZVT/7PkTFqhvVUDK
	NCC6skxXmVE4OMSlWpDNyI+kVBzEMsJ4xLq4CopDz9ib2SQ5IEO+
X-Gm-Gg: ASbGncu383xGkMqTOngfpAHRQGxUrBPr+LcQyiqX1bnBguEf5WdrAWlqMiD4yDF3cua
	dCNfOhs64zieROqVCkIG8PbbDswZQRMPD/HACkMBATxUjdKbBlWGri24NS0NsuTCBgcgBcVdlv4
	0qmxUISgBBJJ7l1ExBSWvKiPTiUmGv0pwDUvp3MCaYEkoI5lhk/RaPy7yWZuDkI0kgAUKJTOIbG
	y1kw5tHHm/h6z/cU7wIDCtp7Wj/eeHMSMH5cR3DScDlQNKUO5RAtA126ycJXDq3lBOo4U2AxNd5
	VpfWMyBms/OeDx6Zu5/NrUZXM0ZMSoBNgnu7UKrZ
X-Google-Smtp-Source: AGHT+IHONlCCM64wd/nRA8RJxkqOAPFt/TljZ4Y/sOCGYF0ww/K9M13/z4WHBEfBSYmCJg+CXOCEpA==
X-Received: by 2002:a17:907:6e86:b0:ace:82a6:b938 with SMTP id a640c23a62f3a-acedc673c5cmr131805566b.36.1745974024087;
        Tue, 29 Apr 2025 17:47:04 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41c491sm846098566b.34.2025.04.29.17.47.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 17:47:03 -0700 (PDT)
Date: Wed, 30 Apr 2025 00:47:03 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/10] mm/mremap: introduce more mergeable mremap
 via MREMAP_RELOCATE_ANON
Message-ID: <20250430004703.63rumj4znewlbc2h@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
 <87e668d54927bb4ccdb7d374275e0662de667697.1745307301.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87e668d54927bb4ccdb7d374275e0662de667697.1745307301.git.lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, Apr 22, 2025 at 09:09:20AM +0100, Lorenzo Stoakes wrote:
[...]
>+bool vma_had_uncowed_children(struct vm_area_struct *vma)
>+{
>+	struct anon_vma *anon_vma = vma ? vma->anon_vma : NULL;
>+	bool ret;
>+
>+	if (!anon_vma)
>+		return false;
>+
>+	/*
>+	 * If we're mmap locked then there's no way for this count to change, as
>+	 * any such change would require this lock not be held.
>+	 */
>+	if (rwsem_is_locked(&vma->vm_mm->mmap_lock))
>+		return anon_vma->num_children > 1;

Hi, Lorenzo

May I have a question here?

>+
>+	/*
>+	 * Any change that would increase the number of children would be
>+	 * prevented by a read lock.
>+	 */
>+	anon_vma_lock_read(anon_vma);
>+	ret = anon_vma->num_children > 1;
>+	anon_vma_unlock_read(anon_vma);
>+
>+	return ret;
>+}

-- 
Wei Yang
Help you, Help me
