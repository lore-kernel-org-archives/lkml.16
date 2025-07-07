Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA4B25A35D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 03:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751860318; cv=none; b=CeX+3zRe1f7/tNt5kZ+qGqJnk97/MCfbRvfZTG/0GTqG82g2UNg3agCYKZ0fgpqbgDrXTDhMbXeyBxqK4dcxczea4KMaqigXr/bw/zfLlKBSKptStEF5klT4HV+lcUJtdBMcwpf71fcq9tTLgz8zF3vzi2VoFmp4TNDGQBE35ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751860318; c=relaxed/simple;
	bh=5EZI+GclKHIjsF4G2WIeh1ZGmWmiooX/yZgB5YiBNiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xr1fZvVScHKF8C1/JOMYPX0mK698L+i1lDBTp8EGS/CnYovqAvirxeM4qSCaHQSbyCxiKtY7QFDYApU4OOttf/KCIEktw/gxmDll0o8GW+nlIPnnDiOYaP4cmh38677fxqZNFnsZdnM3GnAis49AYEv4p+RcAyrWo0mDyHjiqwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FGfS9Tar; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FGfS9Tar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751860314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5EZI+GclKHIjsF4G2WIeh1ZGmWmiooX/yZgB5YiBNiM=;
	b=FGfS9TarJ9GKf3tLQbC5nP4DEqhtMqm13Eg9HPE5URzfhhbXETAwGKctXTWuIH/A4CkHeD
	G+1+RBkUTSPppiJPfRaeEjQQsVl1X0ojTEgIyDPIE5JuL067EgVUMGbMAP76AA4YCd3KZi
	i++zo8xU5dZv547pyoD8C0ve+NIL9Qg=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-ovVvjidfM_S9ZuJi8F_Ybg-1; Sun, 06 Jul 2025 23:51:53 -0400
X-MC-Unique: ovVvjidfM_S9ZuJi8F_Ybg-1
X-Mimecast-MFC-AGG-ID: ovVvjidfM_S9ZuJi8F_Ybg_1751860312
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74d15d90cdbso258583b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 20:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751860312; x=1752465112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5EZI+GclKHIjsF4G2WIeh1ZGmWmiooX/yZgB5YiBNiM=;
        b=kYLKndlY3Ae986NAa0+WBdihFyP87oKwliiUoSPv7byskWS1B1rOM4Txj6LM8ilMe4
         fBlsTcfqMja/kIHgOWDefwvmvXrewn31XOXMpsGRqevadduZGmxKIqO5EcPwy+FT1BS5
         ILfNuiGK252q6SP6sAox7rLgeicjWbNGmCaNneKx+PSrz0SuPKTEkJOk8bcRvF8RsFHY
         3oGLfhQz0WlK/YWfCOdtkWAvIoQ3ZO/e6ioq7iWlgWqwQAb8LjWqG3cpYdnmzNIfr4Uu
         eb0lHATPSJRjcJlcU02MVEAU+I4HOA75fGMN/34JT+eeUCErweNWu+DOtQRuSgU+qTk4
         cDOg==
X-Forwarded-Encrypted: i=1; AJvYcCV+lfulz9U6E3K/6NwANOD2u++XnM3B5dpInsa218SOIrQPImq1litHSzGM0XxS7B1FYSVnn+EHSNsimt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlpLg0/B4M0QcpXSE1ibgCJH//FVjN8UsMzWIJdBhCLxipUgS6
	G7/wNJrExDcAL3Sk9EhO0LsCkorvkc12dSgx9JTCGjL9xuKLQgScXU9Ps3aCgW+CQYaXMESutkB
	pGHjv33cmKLRS+H9DtvOstOUs9Eo6lq2bU5B/O8EQsElRQtMZdcmtqet0CGBRFLA6Y/WpdF4/DD
	ur1A25Y21a9a0HCEEH2/TwWoGYcaWt/yNFtgj2Agqr
X-Gm-Gg: ASbGncvS/rdAAtjd1oX8SVkI83HbvyIXx4Ng5eCJ7t52FCtfOxzDItze/Af7+oQsoQJ
	iZ8ZxrRF3VJyHA3kQljC155dHOtNrwLo73NWy0W3waLFATI9Ew1Hr1I8iSOV/RzzaEraUyO6wfD
	BshPEi
X-Received: by 2002:a05:6a20:939e:b0:216:1ea0:a526 with SMTP id adf61e73a8af0-2260c04c9d3mr18347325637.40.1751860312147;
        Sun, 06 Jul 2025 20:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFYuA1/SDv4DPAfRBP+N/dVZPXqJ7DNMQUuxoTwmIei5Gv5QAB/rrDAkSfUXI5du2gE7RHIZofQPd7Xgc1Iug=
X-Received: by 2002:a05:6a20:939e:b0:216:1ea0:a526 with SMTP id
 adf61e73a8af0-2260c04c9d3mr18347280637.40.1751860311651; Sun, 06 Jul 2025
 20:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628183405.3979538-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250628183405.3979538-1-alok.a.tiwari@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Jul 2025 11:51:40 +0800
X-Gm-Features: Ac12FXxCOhDwwDbuNentETbGphcvFtPA7kSwG5_ttKgdEpYwjr11UVtKgtQBWUg
Message-ID: <CACGkMEs1m3guN=vgTKbSMyfP1SXZqTRcEqTrghwHA9VRPk9RAA@mail.gmail.com>
Subject: Re: [PATCH RESEND] vhost-scsi: Fix check for inline_sg_cnt exceeding
 preallocated limit
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: mst@redhat.com, michael.christie@oracle.com, pbonzini@redhat.com, 
	stefanha@redhat.com, virtualization@lists.linux.dev, darren.kenny@oracle.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 2:34=E2=80=AFAM Alok Tiwari <alok.a.tiwari@oracle.c=
om> wrote:
>
> The condition comparing ret to VHOST_SCSI_PREALLOC_SGLS was incorrect,
> as ret holds the result of kstrtouint() (typically 0 on success),
> not the parsed value. Update the check to use cnt, which contains the
> actual user-provided value.
>
> prevents silently accepting values exceeding the maximum inline_sg_cnt.
>
> Fixes: bca939d5bcd0 ("vhost-scsi: Dynamically allocate scatterlists")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> Reviewed-by: Mike Christie <michael.christie@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

