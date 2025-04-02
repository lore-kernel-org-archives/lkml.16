Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61BE13D8B2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608414; cv=none; b=LL3+qpynGjzQW7lZauWDQncy+7Fx7YpqDOecgm2Q0sdeVhM6YWnyHzEqN1JINdoBS5epK1ZBiFzAKrJmPi6yMKV9soZQBN+anOK5+Rq6k1Se4hHYsVKri7T9Ag+sBEH9ogOgJYeitwUJbQEbFsXv0y7dBUDameJRGLcsnsF05bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608414; c=relaxed/simple;
	bh=Pbq1dx/OnJbPO7NellCFhQ39y6lY/rmd0Eej3PvX2s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uViyTKCLNcRt2jVacpEqVkKmDUK/DtYtNrM3QsM2rWS5iqiZMuYl/qko+PdbQpTm7qZRIn/bkPrCrr+ztun5vKR2yHwcloTcrUoCgOC1F4weDqRUyrgMJTTHyaT2tKnAQqVHEstZ6BbQSPhh4G+m4lVwN6LV4URn2eEGz/NCKVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hqghdk3L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hqghdk3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743608410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6nUx7Vl7EvSuoWp742ECf14m48HpSY6aOAHXmisq0nE=;
	b=Hqghdk3L0WmHFcqIgTcvZIObcQtFIOPDXqyJzhtw4sP+OYgYlcBt65Qcg6f41sPuHUpPzk
	wxTVE+Pebw4w0Ztk97/1ro+7uTpRgJ2x8UoSeHcrvx/qHJBG9FDyr51gjeiXdK6KcJdyLd
	k3kVnXF7ZQ+ujhVgpytXyGvGXkyCRTw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-bMWvdcjOMo6mOTLoOBm-tA-1; Wed, 02 Apr 2025 11:40:08 -0400
X-MC-Unique: bMWvdcjOMo6mOTLoOBm-tA-1
X-Mimecast-MFC-AGG-ID: bMWvdcjOMo6mOTLoOBm-tA_1743608407
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d01024089so58807145e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608407; x=1744213207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nUx7Vl7EvSuoWp742ECf14m48HpSY6aOAHXmisq0nE=;
        b=r1YqzZRd/RvrhlbBnbjgYWrKGGoxaxWVTTHNRqm5vzbt1fb08fRCwcvTcmkDf9/Ujn
         kxtguLU4qhZDiyIBidaN8wezUBqH3FmPr7ZXF6ULnxO28mIwo6rAWFFYIGBCfAeXO+xz
         +b/gSwIU6W3DQAL7y3qRvJQTgJLzH289IsU3MWaFGL+c+qTgkoTMclb550g4hIB4e817
         182R8I4ebe2p94gEtFX7aB6iAexVsZEFIzWaz2aXItW8a+Dx/mw1708D9DGR+PTCFooA
         YVVeSrNderXssIwzsU37eXDYKVljiHJUdxYOvLbzMKhtQDo5azYRD0KiZ7ZznG2v/kOY
         WRoA==
X-Forwarded-Encrypted: i=1; AJvYcCXV0GA3NyLZpjFTmL+agNsiKfhH2eH9S8odqrmWTOUrUC2dxXD54gZEA9VCEP5+0fGbLBlQHgFOimjFXcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLvGKMC125AAqJukp/QLE7HwgfFYz2YAXelEWmkdFaFcFYTmMM
	FFjhJFmZJxW3gAngVN+Pni7HfZ1l++BfyAymayhPR/aEkiTHpkrQYnO6ZiXOTBI4BLqixE0VGvp
	+aGC3UVK2KobygUG7TV/1OuEUpZc2XmgNpKOVLGTSoIUf0fBDWyEa5SkCYqxoGQ==
X-Gm-Gg: ASbGncswdPur/lpQQUJablUk2zkqx2gCk9zjgthu2yUubaQk8Z2d4ahG9MIlCj7vhC1
	YX0t/JppFPTgPZUUbrY333QD9WZ7GO69YM2vyC4K24J5gXMLIHo5tEP+YFsCCfxqK2K1AzFgJo3
	6QqJpnHVvuC03R8EEXnvLvss8CqgAxqi5kcYXCvS5Ked86UI4mnZcSpSZ9fmFH2vYEgQ8o2LnpR
	vHGFCmOTr/187M1bp1s/gEe3w70QTPukhx/ivOyNUpXYDsMSyxZKlVS0x+6L5W2yWjuoyOe1xYI
	aLam0R5Yqw==
X-Received: by 2002:a05:600c:190b:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-43db61e0327mr166905405e9.4.1743608407263;
        Wed, 02 Apr 2025 08:40:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnFH42jKvsNA+QiJsZ/dd/OiaMejjhtC78pMe0Jb00FkOJVLLyR+cxJWkaCicl8B+/i2omrA==
X-Received: by 2002:a05:600c:190b:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-43db61e0327mr166905175e9.4.1743608406852;
        Wed, 02 Apr 2025 08:40:06 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcd489sm24265995e9.11.2025.04.02.08.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:40:06 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:40:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, stable@vger.kernel.org,
	Maximilian Immanuel Brandtner <maxbr@linux.ibm.com>
Subject: Re: [PATCH 1/1] virtio_console: fix missing byte order handling for
 cols and rows
Message-ID: <20250402113755-mutt-send-email-mst@kernel.org>
References: <20250322002954.3129282-1-pasic@linux.ibm.com>
 <20250402172659.59df72d2.pasic@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402172659.59df72d2.pasic@linux.ibm.com>

On Wed, Apr 02, 2025 at 05:26:59PM +0200, Halil Pasic wrote:
> On Sat, 22 Mar 2025 01:29:54 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > As per virtio spec the fields cols and rows are specified as little
> > endian. 
> [..]
> 
> @Amit: Any feedback?
> 
> > 
> > Fixes: 8345adbf96fc1 ("virtio: console: Accept console size along with resize control message")
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Cc: stable@vger.kernel.org # v2.6.35+
> > ---
> > 
> > @Michael: I think it would be nice to add a clarification on the byte
> > order to be used for cols and rows when the legacy interface is used to
> > the spec, regardless of what we decide the right byte order is. If
> > it is native endian that shall be stated much like it is stated for
> > virtio_console_control. If it is little endian, I would like to add
> > a sentence that states that unlike for the fields of virtio_console_control
> > the byte order of the fields of struct virtio_console_resize is little
> > endian also when the legacy interface is used.
> 
> @MST: any opinion on that?
> 
> [..]


native endian for legacy. Yes extending the spec to say this is right.

-- 
MST

