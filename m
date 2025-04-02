Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AE310F9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 16:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743611944; cv=none; b=fGz/p/dk7V+aZUUXw0NCb5xW3+7Gv+DIw/L9QEVgySVVBxpkR00r7GhXXZPyGDJEv6wutQR7NEe/cVakhvJDr6H5AItiPwBrRpy6Uk8AxCrY0GrYM8vWWhAOChS2RO3JfHEpM3/N5FZEEpv/hexwp9EiENoYq7tfQs1TmcLRQLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743611944; c=relaxed/simple;
	bh=JbpQGyS2k2ae5y5xVtR1Gxoy3SaqtFSjvZ/rBlydswQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TnFGXtqH9g4uzGg7OnxvQi+twzragdiSldbieP7gKHypzbp290xuWe0gapSCO5hql6drdnDOcHjgzrqGMAwDY3KmGu5klQz6js4yB8ADFKiNspDzl5NBR4deTI4LHyM0PMzatV7VE+FcOoFb/8FQC6HfXJx9Kd9WO8GFiWJxrPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=etBGqs3u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="etBGqs3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743611939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jA07gZAckB5bQhywn6Vwf6YGCI+Gg9x9Lpp/1wjtdSQ=;
	b=etBGqs3uXVxdyuDntip6FyhlNGsF2sPyk7/zlYITsWy522iYH8mMBxCNOyWGh7RPmqB1c5
	qaaQLbIvMtCNka6si77ckLNOEhkih7aPzEshNfpPlMa2ugnb4TNnDSeBqIeRpFd4OcxIvM
	l4E4zIrzp5Cs5IPaKbjCdec15ayD7CQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-bpxYVQP6MRGIetaLhITenA-1; Wed, 02 Apr 2025 12:38:57 -0400
X-MC-Unique: bpxYVQP6MRGIetaLhITenA-1
X-Mimecast-MFC-AGG-ID: bpxYVQP6MRGIetaLhITenA_1743611935
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff68033070so11541561a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 09:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743611935; x=1744216735;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jA07gZAckB5bQhywn6Vwf6YGCI+Gg9x9Lpp/1wjtdSQ=;
        b=ioOTf/yu3Ecc9saUmGBWdWV6bh0KXkIWo+gkt9Xm6HZ6+lPNlZrS0Owa8fDav2FVfd
         BkxTG232ZqFIaNUNzfCfcHlYf8w0VubUnpWR7UP7BOwgU0gZeHPTX5RIEGqssuFkR7C6
         Dt3RoISCmQUWq1d46COF9e3d6yyINR8QuhsCpOcgOyNL3cn6Bfk4AY8nlaUkb18wGvqb
         pHFe9r9HypcoDkoWFwZO5tG9aGV6zDJ6y7mKGOY8MSSvoaJRLynDZIsGjnm7VBrvMUhY
         cnmga8ZIfeZvOUXG+xGw8fFTj0C6dZaVYNHk1Db1avAwiDpf+8YTpmYYwPj+iF2svuCh
         33cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQvl6FAottCwGVeabaOFndCfwCmfNHIbeY6BN3WjJ9GPhA3X1E8eb1cCJwfNPZfjgidsRWkyY0h0T8Czw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJi9H1GvefSi5utwt68aPxJQagZz2w7n2WdjuqFNMDO3jWP6cB
	15CU+F9O5sH+kGaq9JDHXLXTcwrriKgWdNYcNNhyo+MrCHLZLH/Wi0/KY6wkDFr26So8SVK1HoY
	3fWXkjK+ZWJ2bSye6Un2RJ6oCuoXXForL3mO7skEwdnB444eNHcUBskPgPugoAyBWNfCsK8dBp/
	9lJGNLtP3SsKMSwBsQz651/IrLh7dusQVdr1Yq
X-Gm-Gg: ASbGncvdtLtVr38Bk634jduWk9/cmr/9ChCrOX+S0zqk3yBNHxDJ5rGeLNV8+KFX7Al
	FFe0epKCVI+pJrI8ULrOJAMgd+3dEvhB0KnRYdmJGr15GSJ/E71laFPNXmrtVSZzr6/sC8g==
X-Received: by 2002:a17:90a:e183:b0:2ff:5e4e:861 with SMTP id 98e67ed59e1d1-3056094b28amr11892721a91.24.1743611935197;
        Wed, 02 Apr 2025 09:38:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJeSWFRN5z2wxWXtKvRsOPT5CfAHrY7buz3TM6wH9tz9gjBfwFVkgsnjlHEgDTEqYebTRrhaxUSg2BrAW/4wM=
X-Received: by 2002:a17:90a:e183:b0:2ff:5e4e:861 with SMTP id
 98e67ed59e1d1-3056094b28amr11892695a91.24.1743611934877; Wed, 02 Apr 2025
 09:38:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Apr 2025 18:38:54 +0200
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <CAAfnVBki816fSPuQ_FcvuwYzbSwiS_WaYsGSA1AyitmAA5OsXg@mail.gmail.com>
References: <20240723114914.53677-1-slp@redhat.com> <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
 <CAAiTLFV6mAgrMj=itcxoBCibvYRyrAk02wYp-gYJ8kxhF0EPmw@mail.gmail.com>
 <CAAfnVBkWKn3+YEhNz0CTmw-T_jjL72axkWqYgkzkSa72t_Gf0A@mail.gmail.com>
 <CAF6AEGsnpEYFsCfZUAPopWzY=wv_GWn0P5f5D6U9y-JrWGQVnw@mail.gmail.com> <CAAfnVBki816fSPuQ_FcvuwYzbSwiS_WaYsGSA1AyitmAA5OsXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 2 Apr 2025 18:38:54 +0200
X-Gm-Features: AQ5f1Jqh3JlHDowKtF1SlejjtYnTX8s9zM8BYZmloreOmj3oPMj4ojBdK_5F-_E
Message-ID: <CAAiTLFWOfX+TOcLFKpgqZvGoC6xSbDyHcefET-jtbm=bCTtqeQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Gurchetan Singh <gurchetansingh@chromium.org>, Rob Clark <robdclark@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, tzimmermann@suse.de, mripard@kernel.org, 
	olvaffe@gmail.com, kraxel@redhat.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, airlied@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gurchetan Singh <gurchetansingh@chromium.org> writes:

> On Tue, Aug 6, 2024 at 1:15=E2=80=AFPM Rob Clark <robdclark@gmail.com> wr=
ote:
>
>> On Tue, Aug 6, 2024 at 9:15=E2=80=AFAM Gurchetan Singh
>> <gurchetansingh@chromium.org> wrote:
>> >
>> >
>> >
>> > On Mon, Aug 5, 2024 at 2:14=E2=80=AFAM Sergio Lopez Pascual <slp@redha=
t.com>
>> wrote:
>> >>
>> >> Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:
>> >>
>> >> > On 7/23/24 14:49, Sergio Lopez wrote:
>> >> >> There's an incresing number of machines supporting multiple page
>> sizes
>> >> >> and on these machines the host and a guest can be running, each on=
e,
>> >> >> with a different page size.
>> >> >>
>> >> >> For what pertains to virtio-gpu, this is not a problem if the page
>> size
>> >> >> of the guest happens to be bigger or equal than the host, but will
>> >> >> potentially lead to failures in memory allocations and/or mappings
>> >> >> otherwise.
>> >> >
>> >> > Please describe concrete problem you're trying to solve. Guest memo=
ry
>> >> > allocation consists of guest pages, I don't see how knowledge of ho=
st
>> >> > page size helps anything in userspace.
>> >> >
>> >> > I suspect you want this for host blobs, but then it should be
>> >> > virtio_gpu_vram_create() that should use max(host_page_sz,
>> >> > guest_page_size), AFAICT. It's kernel who is responsible for memory
>> >> > management, userspace can't be trusted for doing that.
>> >>
>> >> Mesa's Vulkan/Venus uses CREATE_BLOB to request the host the creation
>> >> and mapping into the guest of device-backed memory and shmem regions.
>> >> The CREATE_BLOB ioctl doesn't update drm_virtgpu_resource_create->siz=
e,
>> >> so the guest kernel (and, as a consequence, the host kernel) can't
>> >> override the user's request.
>> >>
>> >> I'd like Mesa's Vulkan/Venus in the guest to be able to obtain the ho=
st
>> >> page size to align the size of the CREATE_BLOB requests as required.
>> >
>> >
>> > gfxstream solves this problem by putting the relevant information in t=
he
>> capabilities obtained from the host:
>> >
>> >
>> https://android.googlesource.com/platform/hardware/google/gfxstream/+/re=
fs/heads/main/host/virtio-gpu-gfxstream-renderer.cpp#1691
>> >
>> > If you want to be paranoid, you can also validate the
>> ResourceCreateBlob::size is properly host-page aligned when that request
>> reaches the host.
>> >
>> > So you can probably solve this problem using current interfaces.
>> Whether it's cleaner for all context types to use the capabilities, or h=
ave
>> all VMMs to expose VIRTIO_GPU_F_HOST_PAGE_SIZE, would be the cost/benefi=
t
>> tradeoff.
>> >
>>
>> I guess solving it in a context-type specific way is possible.  But I
>> think it is a relatively universal constraint.  And maybe it makes
>> sense for virtgpu guest kernel to enforce alignment (at least it can
>> return an error synchronously) in addition to the host.
>>
>
> virtio-media may have support for VIRTIO_MEDIA_CMD_MMAP too, so could run
> into this issue.
>
> https://github.com/chromeos/virtio-media?tab=3Dreadme-ov-file#shared-memo=
ry-regions
>
> virtio-fs also has the DAX window which uses the same memory mapping
> mechanism.
>
> https://virtio-fs.gitlab.io/design.html
>
> Maybe this should not be a virtio-gpu thing, but a virtio thing?

There seem to be certain consensus that the information about alignment
restrictions must be shared in a device-specific way:

https://lore.kernel.org/virtio-comment/CY8PR12MB7195B5E575099CD9CA1F2F39DCA=
F2@CY8PR12MB7195.namprd12.prod.outlook.com/T/#t

There's also the precedent of virtio-fs already sharing the alignment
restrictions through FUSE_INIT (from VIRTIO SPECS 1.3, section
5.11.6.4).

---
The driver maps a file range into the DAX window using the
FUSE_SETUPMAPPING request. Alignment
constraints for FUSE_SETUPMAPPING and FUSE_REMOVEMAPPING requests are
communicated dur-
ing FUSE_INIT negotiation.
---

Given this information, I'm going to rebase and respin this series.

Thanks,
Sergio.

