Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C27513AD1C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745247366; cv=none; b=tZhkXByRftgMxgWEOCePyXPaRyaqzEpCzBaUdbA+O5L8U0Ll7KPMKIpSaWmrq5IA5hGtxBmb8fY2kr8xPvnRbDZNM+jKXcVNloRw12TPXf9RxKXbvnNQzFF+3Os3yt6mCTsfuLD8eernRJk5w+0b/NZbrgmz7y36qkUlRHfKiSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745247366; c=relaxed/simple;
	bh=ELRmkTdRqMv3QmAXEhzU+df4jLtDbLH6i9rhrVJgjrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecoO82LpCuZyVH/XFfxhBiwztXyuEdkrahaWgHDsjE/XE1W7TLuUC4JRydg9B+EvrFgJdqTaN/tEKu9aSz+xXKQB8bSD4YopgCN5CxyUMdWmbCH0D98NiEg2uct2iy2eDvvt6CPvowKTUVoe0eiBNeGtPcSq8dotxo98HfXiph0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=f5r1s4EH; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="f5r1s4EH"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476f4e9cf92so29180831cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1745247363; x=1745852163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELRmkTdRqMv3QmAXEhzU+df4jLtDbLH6i9rhrVJgjrk=;
        b=f5r1s4EHUsSKsKyl1yI0fQHcAxCTZeDS55jthIPbYizhG+niM/IpLvKeSEC1Ikp+Nc
         5ezosHfsIIy2OwIsaPX8ND06iX4MhMQ3PTFV64HGQKVfR7ynOAOMgzgmceD9Y5vJ4GcG
         B/M2ZpV4xvgUVyYsuJwZvf4rM7CKaY51EFRDgC54EtpzGh+6TzJGR8M3U2ce7ja4qrd7
         bkLCSG4/FY/06kK7XdOM33pGGTv/zsND8nBlaBFtIKjvogtGe+EyBvieeDkUmDvBJakI
         Jn7Mcv/fCHPpdlvsgONRRXiff+gcYkoUkt5OupdElIWT51nkCtOhZEDkTX9rJKXHgoPy
         XIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745247363; x=1745852163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELRmkTdRqMv3QmAXEhzU+df4jLtDbLH6i9rhrVJgjrk=;
        b=KdCj4UzOAzYPj5OVIGpyKQIKHZKiwgYWXmrGguhNn3fpnJhtrdND46/ol5qqyTbDCb
         dMisksMG4DqxK2HkGUYp//nXPXBDm+gfU7FcPwRNVnpc4HoT6AyCx3JrGYXI6mshI66g
         VNgJkLESWaBBhjZ48zbVer/wLqfeSwi5Y3dpFLDctq5g63xFW9SuZoWPn1J5rwnUkke7
         H+iGg0jCw+La3oIgqolo20qQrnKpWUok65Tv6ZxSA2MVu4GkXLePC8q0UGafs9b+hz5g
         CgmQcO13pcql1+l9SmnFZ1AKQg9Qq9SCY9J3BlTJrdRfPQErwEqs+bHSXvLNiMPnxbwe
         SMYA==
X-Forwarded-Encrypted: i=1; AJvYcCWkRA3C3WWI0wFhE8lOOpRDmdgTNNGuvVA16oqmBWSguD6KYnC7JlGFdmO3otyrBrRi7/WO7h9atGTrW0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEu2PO+yWuROnsBXtiSYAKpiNHXahZp5If8wELus98qRyx+cnh
	BxqQZsBbhKlkHskwlAESq39Q96j4MQBXYxug5K9N/buxzMUVC9YK5OEIH6J/HQdzXrl9i08dcA7
	dC7fva2u46rUyW3L/KVjk/1LFbDuU9DVl53V03w==
X-Gm-Gg: ASbGncv9f+/FVVGEGXI8xxYljiqZFskwfNrBqw//sYQiEqUjCXln4fgcICS+H41hJFg
	ebhDbjqnkNXBKsnc4WLADRnLKVlH/e2OReQlX9QemscLFGVXyLQ1Y0wq/1nRbBdoYrlPL21aKA3
	MfvpGAB4WS5hzqVw7400w=
X-Google-Smtp-Source: AGHT+IG7rZTE99WK1bHTOSOgL8Ei1b2E10Kh9ByX6KEwCjeK4vA8bx+QufdyTPIfemEXj3xR90xjsvbo9nLMMoN+O1w=
X-Received: by 2002:ac8:5946:0:b0:476:83d6:75ed with SMTP id
 d75a77b69052e-47aec4c3d0cmr197368441cf.34.1745247363105; Mon, 21 Apr 2025
 07:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417142525.78088-1-mclapinski@google.com> <6805a8382627f_18b6012946a@iweiny-mobl.notmuch>
In-Reply-To: <6805a8382627f_18b6012946a@iweiny-mobl.notmuch>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 21 Apr 2025 10:55:25 -0400
X-Gm-Features: ATxdqUG02lj5rHej_8Beu9BNKw0fpQPgfWQ79J7N0ZJ28950dBS1dnNGeIj5FpI
Message-ID: <CA+CK2bD8t+s7gFGDCdqA8ZaoS3exM-_9N01mYY3OB4ryBGSCEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] libnvdimm/e820: Add a new parameter to configure
 many regions per e820 entry
To: Ira Weiny <ira.weiny@intel.com>
Cc: Michal Clapinski <mclapinski@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, nvdimm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2025 at 10:06=E2=80=AFPM Ira Weiny <ira.weiny@intel.com> wr=
ote:
>
> Michal Clapinski wrote:
> > Currently, the user has to specify each memory region to be used with
> > nvdimm via the memmap parameter. Due to the character limit of the
> > command line, this makes it impossible to have a lot of pmem devices.
> > This new parameter solves this issue by allowing users to divide
> > one e820 entry into many nvdimm regions.
> >
> > This change is needed for the hypervisor live update. VMs' memory will
> > be backed by those emulated pmem devices. To support various VM shapes
> > I want to create devdax devices at 1GB granularity similar to hugetlb.
>
> Why is it not sufficient to create a region out of a single memmap range
> and create multiple 1G dax devices within that single range?

This method implies using the ndctl tool to create regions and convert
them to dax devices from userspace. This does not work for our use
case. We must have these 1 GB regions available during boot because we
do not want to lose memory for a devdax label. I.e., if fsdax is
created during boot (i.e. default pmem format), it does not have a
label. However, if it is created from userspace, we create a label
with partition properties, UUID, etc. Here, we need to use kernel
parameters to specify the properties of the pmem devices during boot
so they can persist across reboots without losing any memory to
labels.

Pasha
