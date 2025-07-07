Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05EE29AB0F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751893850; cv=none; b=eJeHkXkGfzlCXVQ7RSN2C9Kvf28npbMoAfVQNc7n+BnDwfIngK1rumQiCIjLENUxF92kNMrc0pg8GPfavFpE5RGhACMA3OJD+XxhMPeEdjXXnDpKzr2gnO/KrMZLI4KTvclY5mEGhskGn8nPrqMqN9g37mkW5sof3kXw1WP4f7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751893850; c=relaxed/simple;
	bh=T2e37E+d/+lUzdWBKT7ClU2tmNtETnO9/Zor50pUvEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Febm3M068cG9UjGDb+5SWJjXDWRihEE4BA/XMH4D/bWTf3WUnw8hqSBXlMixQF/EcJVqdI2Oe7Jt7/oWd/QRZ+O7iCXwAMDQZ0jUOLOXymN9BT3XnfLhMQXU+lCoe3wFZUOfw4vRSANWIjqNYgaIgs/vyLCodlVMgJdBRAjOfCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DnULwCO6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DnULwCO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751893847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XEurCXj6cd5Czu7Fsl+l7GrfZnKLx/Ef+aDXjk7dI/Y=;
	b=DnULwCO6he/Uh80N4noxlGcrHTL8qv5YT9uO+oLIj3IfW4PUI/4GcW2ULUzkCWGfHTQsf0
	QQ06xmkPF9N9/t4lxGVDtag++kO+RNRzskwlRWIiC1K3Gr4rOBvI/YQIN8+IGYP0p0e3SL
	FKElSdJtMXesHHYtUXEz1s15m5+184Q=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-_XPxgxA_P5WWJa8d4LFntQ-1; Mon, 07 Jul 2025 09:10:46 -0400
X-MC-Unique: _XPxgxA_P5WWJa8d4LFntQ-1
X-Mimecast-MFC-AGG-ID: _XPxgxA_P5WWJa8d4LFntQ_1751893846
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d099c1779dso456656885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 06:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751893846; x=1752498646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEurCXj6cd5Czu7Fsl+l7GrfZnKLx/Ef+aDXjk7dI/Y=;
        b=cG4EHrA6Phg4+gJ1p0wTLA76Xb7C9ddc5i/ghlHJ01IiMKGcBn5IB8yw3/3KgCXRl8
         vyLzTRoiUKLfQOHjHgUSV5nH65cXmLCAvnI+s53drG9NDenrBX0jcUgM80j+PSaPlls4
         Q2xepxTwsRPoyIqrmDXYwDVlZbGB8g1vSRTRUY4AiCvU3m+2tIul8GLXDHxmHq5obU+u
         bG2VYoelNENJfQtbkixKqVrZeO7P+f9GUSpcR40Ba0MH9mR1DomMgEk+1dSGOFopEorN
         3wxzX3ZcPz0juxn1cAkKIlwJ/A/sXjnWRSv1gVLD/qv9On/Vxr6Xh5KFRCh7c7btIltk
         laOA==
X-Forwarded-Encrypted: i=1; AJvYcCXwQ8L0nFeZJlfpPCE3MoZajhOofVkCMUjKc7mvyXyI82Nm1Ip7ozrtTfyR5vD07rGGttjYImHEmAE27r4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbHPyJrn1FFdwpdUkq5F4Y51GcLwLmrY23uy1sn9CCqZSqEhLd
	RFSgMrhazAgZxMsb83DIqb6dJchqE8H8m6tYDW1OafwCY6AwQTcnSFAIQ2RJqHdfxYn+5RCIoN+
	Dpgf2nz9DmvjzibAzzUQoskJgNJnOmVflvbc+pnXiURwBCi2WmjVGx/Q8XL37hOHhTg==
X-Gm-Gg: ASbGncuLDYdPTVITVpHDc2/a7RDon/o5dP3KSn83zfHN529nf9rV+fobl18NoaCMpEv
	qUvfBQVi+q6BJYX0mDYs4IQkcH7L1gP6zzYIeg4tZtLVB6kyl2CepwA6vEu8/Ol3/0hFzLSA695
	4ZP8BG5yiY6461npusaDzWUb+3fmY7qX9wDgky2uxD5LxQa8HepdlApCh9sRID2enl7r7MYOZQZ
	kNiSkMRDNSRcu5xZCcy5qnk0wPbYPWt65Js2nUxirbrqoscWHmlFTRedcfY2wJUaRaQgZjQ9+3E
	gc+aRwTIAwH/CHzN7Jv4oD0UeBOYTmNo4xBxOZJgqnT22z80x7V49w==
X-Received: by 2002:a05:6214:2269:b0:6fb:597f:b4d0 with SMTP id 6a1803df08f44-702c6d0e528mr171252556d6.6.1751893845176;
        Mon, 07 Jul 2025 06:10:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHES3tBHX5kljzjo+zsdbXDUJb6DU8frN39bUwjA5eUGrwKv9iaI5DG5u57DeA1U5hMj2i4tA==
X-Received: by 2002:a05:6214:2269:b0:6fb:597f:b4d0 with SMTP id 6a1803df08f44-702c6d0e528mr171251906d6.6.1751893844672;
        Mon, 07 Jul 2025 06:10:44 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc771esm57828126d6.6.2025.07.07.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 06:10:44 -0700 (PDT)
Date: Mon, 7 Jul 2025 06:10:41 -0700
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
	christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] dma-buf: heaps: Use constant name for CMA heap
Message-ID: <aGvHUTC7Kbe9lru3@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <20250610131231.1724627-1-jkangas@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610131231.1724627-1-jkangas@redhat.com>

On Tue, Jun 10, 2025 at 06:12:28AM -0700, Jared Kangas wrote:
> Hi all,
> 
> This patch series is based on a previous discussion around CMA heap
> naming. [1] The heap's name depends on the device name, which is
> generally "reserved", "linux,cma", or "default-pool", but could be any
> arbitrary name given to the default CMA area in the devicetree. For a
> consistent userspace interface, the series introduces a constant name
> for the CMA heap, and for backwards compatibility, an additional Kconfig
> that controls the creation of a legacy-named heap with the same CMA
> backing.
> 
> The ideas to handle backwards compatibility in [1] are to either use a
> symlink or add a heap node with a duplicate minor. However, I assume
> that we don't want to create symlinks in /dev from module initcalls, and
> attempting to duplicate minors would cause device_create() to fail.
> Because of these drawbacks, after brainstorming with Maxime Ripard, I
> went with creating a new node in devtmpfs with its own minor. This
> admittedly makes it a little unclear that the old and new nodes are
> backed by the same heap when both are present. The only approach that I
> think would provide total clarity on this in userspace is symlinking,
> which seemed like a fairly involved solution for devtmpfs, but if I'm
> wrong on this, please let me know.
> 
> Changelog:
> 
> v4:
>   - Fix ERR_PTR() usage for negative return value.
> 
> v3:
>   - Extract documentation markup fix to separate patch.
>   - Adjust DEFAULT_CMA_NAME per discussion in [2].
>   - Warn if the legacy heap name and the default heap name are the same.
>   - Fix DMABUF_HEAPS_CMA_LEGACY prompt.
>   - Touch up commit log wording.
> 
> v2:
>   - Use tabs instead of spaces for large vertical alignment.
> 
> [1]: https://lore.kernel.org/all/f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com/
> [2]: https://lore.kernel.org/all/CANDhNCroe6ZBtN_o=c71kzFFaWK-fF5rCdnr9P5h1sgPOWSGSw@mail.gmail.com/
> 
> Jared Kangas (3):
>   Documentation: dma-buf: heaps: Fix code markup
>   dma-buf: heaps: Parameterize heap name in __add_cma_heap()
>   dma-buf: heaps: Give default CMA heap a fixed name
> 
>  Documentation/userspace-api/dma-buf-heaps.rst | 11 +++---
>  drivers/dma-buf/heaps/Kconfig                 | 10 ++++++
>  drivers/dma-buf/heaps/cma_heap.c              | 36 +++++++++++++++----
>  3 files changed, 46 insertions(+), 11 deletions(-)
> 
> -- 
> 2.49.0
> 

Hi Sumit,

Just wanted to check in on this since discussion has died down this
iteration: what's the status on this series? If there's anything I can
do to help, I'm happy to lend a hand.

Thanks,
Jared

