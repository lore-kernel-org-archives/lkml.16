Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E912B29CB47
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701393; cv=none; b=MvmMekdbNWSsO7gGQIFKb+M6aKJtsSH0eafQxhOHmYS1jaZnQujjE0kOPzsiTkxxt1Mg96FULIvvwCZj3A/qDErY9XIxr/B4sJs1STY5OzKXZaNVGpv3bwW/sx4S/qbZyIVxDItR7sV9idyZEdatFO5tFA4lSXk7erd9jVDjEGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701393; c=relaxed/simple;
	bh=DzRRnPTB2LNWuxiYm0nrmev04lF0jbZgFANvtwJCwzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZE6RjybSpAV9gHijKC0D0iOVhE06IoevQbGjbKs67mQjn5Wwa/7wAQVlsqc767sU/vfN8KBfDlc1B9UoHNOWfGV/s1QXJyQOIFy0vzzdfE79p6cIc5k45v/TuoMA9pagt7ulxzduY6FhJrttgauBx15BuLxU43SamjZMtSOFhBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MVSDxLU2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MVSDxLU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750701390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zAP4I76aRvwU482/v/E9FjrB6NIMhTqRHfukS6o9qfo=;
	b=MVSDxLU2ret3dtH3+01mm80sQe8d04p2avNdKPW4TE9kI66AMU+a8VtIu/lEAr0XvgQdKX
	AiQRM/nb4pQt9zLjmKdI7/+SKwkFbieZDsiVv07BUikKoYCJE5Ju/iIR7KA5CAfrdJPcXl
	+aPQQ3AVIzhKnjTGJQMAgnpm6r00qQ0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-zwcf93M4PKu_ffV9MQqyWg-1; Mon, 23 Jun 2025 13:56:29 -0400
X-MC-Unique: zwcf93M4PKu_ffV9MQqyWg-1
X-Mimecast-MFC-AGG-ID: zwcf93M4PKu_ffV9MQqyWg_1750701389
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fafb2f0a33so65581976d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701389; x=1751306189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAP4I76aRvwU482/v/E9FjrB6NIMhTqRHfukS6o9qfo=;
        b=MjGdpidIYR16nyjRbSHRq71UckkkW/rrMxKKwmsp744vDISlvm8oJ2nrQXVnKLHasx
         A7rUnzTgVFeYPs3KQH+O+pWcPVvtxrL5bfGFV2x7kAzR077V6QVh2yvc9xLKeEaps8K6
         9ZHMYgs3jBo9BUkB1XRkaU4/TsQ08PJpBNUuu0QdI6ipkMJ+UmaYsxrWvU8Ro0UTlGsZ
         Pj8A8B8ttFr0738Dnqlh53K8NfncSzbHj+2eDIMOl5zmu8QvuZRoaGMf0lUDuhq748di
         qIRBTsS9lTMevAet8E3kCzqsR2Ti+SaZSa8+rum2cXQ9PzJfdthVPLtdMhZvES53J2Gv
         l38Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIPWvkHFeGMz+bBjXewNwR1M3m/StNzLqM58VJH0ck/RsbiBoqxqP7r8VMW5tRVS0y2/SH1cYw0iNWqmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YykYnQrzpN2ta9YgJqWX+CLEZVtkM2CQjXEekOceP0KS4x6Ljpl
	Xx7rcWEZ+itTDKk8YhpBY5RvY4ppsm8HyjeHjQzjlcAuJpEWWkdm+Ey84oD+vchGaBtkL4ittIs
	MlLFmzu0zInibmzgHqgom2dB7YpjqQwXXd10ffBzh2RM8x48l7ru2eIGAlOuP/9ZAxA==
X-Gm-Gg: ASbGncusz1F7/NA0wEvUrk2gGcSSsGaW2/UEXNNCbqVw+u92exB3gIl5mhGhMmLlD2/
	xdiKgJuztPvzZ03NSKeDNYIqrttCJG9nc2yYe1PulzbM3bwbM6o5GPf2woY2qJngeRg+0uxXZKR
	mNO28uGFG000gKm8QGmruhfOIq+v8qxxeve0LSihAbEGlg+YKoraMnTWkX20rTkhLT3VFqSmH/X
	OC3d1Xes0RKs1q4sGCtK88XEjcdwZ9WQOLGpSiBOzikBYvB/hmj5dWIDAGLpuBSUwCViKzcXqzg
	mOZa3Nhexh0Dvg==
X-Received: by 2002:a05:6214:124d:b0:6fa:c697:97a5 with SMTP id 6a1803df08f44-6fd0a46f07fmr226253936d6.15.1750701388642;
        Mon, 23 Jun 2025 10:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/FLdjZxCgyRTpZYIb9IucZ54oRQRRALkjr2e2U/ntkzEs5JauBJHufBiD77kYXZlTNhXGcg==
X-Received: by 2002:a05:6214:124d:b0:6fa:c697:97a5 with SMTP id 6a1803df08f44-6fd0a46f07fmr226253516d6.15.1750701388248;
        Mon, 23 Jun 2025 10:56:28 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99a5c62sm411933185a.31.2025.06.23.10.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:56:27 -0700 (PDT)
Date: Mon, 23 Jun 2025 13:56:24 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aFmVSNrPK9a2KN7p@x1.local>
References: <20250620190342.1780170-1-peterx@redhat.com>
 <20250620190342.1780170-2-peterx@redhat.com>
 <1e6fcebf-f74e-46ad-912b-d7df13527aea@redhat.com>
 <aFld0LpB429q9oCT@x1.local>
 <0126fa5f-b5aa-4a17-80d6-d428105e45c7@redhat.com>
 <aFmM4XXTC6gEmdR-@x1.local>
 <471e95bc-ea2d-4c37-aad6-0062b4457054@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <471e95bc-ea2d-4c37-aad6-0062b4457054@redhat.com>

On Mon, Jun 23, 2025 at 07:25:11PM +0200, David Hildenbrand wrote:
> Oh, yes, agreed on WP_ASYNC. But they would not be using the vma_ops thingy,
> right?

Yes, currently WP_ASYNC bypassed that. So if something declares WP in the
uffd_features in the new API it'll be only for sync (and it really should
almost start working for most files too like what async did..).

-- 
Peter Xu

