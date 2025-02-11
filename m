Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDA91BC4E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739236608; cv=none; b=gBIW/SZBK6qR/AgiJFZWmGvrtbaWPYstzhCLYx6wqNwQsy4mlIzNEUIAyKjmqFHX6ZM+yT9OuEo8tXYt83qqOVy1xepTVGN36QMFijXrG62ni+qHxr3VwcI62GzwKyZK10SLNSgqWn7K40CSTwS6/55HYHq3WgEGuMmCLGMpc2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739236608; c=relaxed/simple;
	bh=4bMf2krmehBME/JGGSJ2OFdq4bknMLcJ1KY7t6wdCdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+PEiNfC6HfeDOXRfkJFRi1taPCr+JNl7z+QtnSaiHQEn8lBgduN51P7LyHO9WZKhXpSaGSrcU6WYt5qVFOOgrfJZnHnHU4WaWohnxz7c6B7gDJC3T39Mqm7j7DGrb+yFJjzmNacBehyiiLra8Ie889F+7k/SENR4cxoZ/LX9M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vkxekRZA; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vkxekRZA"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5440f27da4fso2878e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739236604; x=1739841404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIDLn0ElhLkZLGHEXZdCvG2zMlN0W10JkA618ESIp5I=;
        b=vkxekRZAi6lY5O53eCJluc66k4fUO5y0FaKA0jM2rD6BAlweuG28El+AdS4hhV8VUg
         qS8BR7JsTimggOLKhFV5QfJjVNlKnt7lftYyHB3cOtEU7hftrN/03MWApQjrajUa8EcY
         N9PiXRymasmWlA8C4kI2KxH8hrRYLF5XjOdC09+BBNByZ6/ERFdhUKfh3QWmcAdwJiyw
         Va2iE8HDVk3SxjKO6DBI3y9Tc08kuHCNqoYly+XcCJkWCJsWK3tnpsiATui45VQUC/De
         c8CnPecB7UcVPbu6NY+Iw0ytUh6xyKPkyk+5KpkXyk+q3842pr+FJ7HKnDy2OzqkcplA
         YaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739236604; x=1739841404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIDLn0ElhLkZLGHEXZdCvG2zMlN0W10JkA618ESIp5I=;
        b=v2b9FWFthpCSZvUm+/NBTrFYheACtAVyMYkTqulGGLC/mv4Ny+zNKDS7PVh4Brcf9P
         pi2/sFN50ZGZoY//TkPEtBTX/g9cXOxzF5RmwshjkXWV2MNUbiVAeuGE91FdN6eYArUY
         IFJzDtyHpVPTfulx3sPTkGuLXJkXcPDEPbjxc8lsk1TjIN7W586jA8CPEZQUC52BxUto
         04OhoZaQJ0FNGh3zR7U4nBmiVUsj+IirrxxC5eaQ02IZqX1ey82ay2T1QWqEpfT1ov2j
         eHc42i8Q5t8QJUozJ5Nvsur5EzNajfHFih/P0u2qnJ/Cjez6y68scpd+U0goWWBhmKtb
         LnEg==
X-Forwarded-Encrypted: i=1; AJvYcCV+FOOshKnj3wInt9QYb6Dn7s1xyWgOVa8PHgRpdTgeDjo/9WAkS+DD3zNHQ3gh9cqK951EDCFsVimg+4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbeFCiBMfXFex4Vf0/PsE+yzRzyq9mmV3hBt5au7pAKiVrTerx
	RqDoSdm4NNQVAa990S4QXsDhqb9pZWQ0jiP1RP7spjB8ewRU9/5ukXqQmHH5QbL0lbiJ9OeANni
	nr7xQ0HXBjKj8GqsdAV1rcB4tWPJoDigPNq1B
X-Gm-Gg: ASbGncuHLy7/F2z5+ETN+pbeKRMggZ17ipXeL4CZpgQlO0K1PQNprcpQoTtVWR45yw9
	N+3ZWFfEsty0yabPOD0zgTQNAjsUA96GSMAibkwEB21yHoKAOoONAM9t3b6PQH+VZHUT5mc2WcI
	connL19ZIh++KKvBy3MU0dR48SCZkTCQ==
X-Google-Smtp-Source: AGHT+IGrKDG92DdGOlwP7eJ/9LFEBgOFycMhnxSp1JHwnKefb0ClNrqUUYEZEfsa6sdnN6IhjulSH17jSWCq6Fyov30=
X-Received: by 2002:a05:6512:1387:b0:542:9910:b298 with SMTP id
 2adb3069b0e04-54513af6b32mr59896e87.7.1739236604383; Mon, 10 Feb 2025
 17:16:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212063635.712877-1-michael.roth@amd.com>
In-Reply-To: <20241212063635.712877-1-michael.roth@amd.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 10 Feb 2025 17:16:33 -0800
X-Gm-Features: AWEUYZnu8DZ9-gWy_ugkJ_6BkgXs-pViupxKo87Cy1AcHvUKcORw34feJYU-gN0
Message-ID: <CAGtprH9ehiz+yKfQqj6JeObaPv0DPUsoAH+YVdSeuzL9zhw9tA@mail.gmail.com>
Subject: Re: [PATCH RFC v1 0/5] KVM: gmem: 2MB THP support and preparedness
 tracking changes
To: Michael Roth <michael.roth@amd.com>
Cc: kvm@vger.kernel.org, linux-coco@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, jroedel@suse.de, thomas.lendacky@amd.com, 
	pbonzini@redhat.com, seanjc@google.com, vbabka@suse.cz, amit.shah@amd.com, 
	pratikrajesh.sampat@amd.com, ashish.kalra@amd.com, liam.merwick@oracle.com, 
	david@redhat.com, ackerleytng@google.com, quic_eberman@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 10:37=E2=80=AFPM Michael Roth <michael.roth@amd.com=
> wrote:
>
> This patchset is also available at:
>
>   https://github.com/amdese/linux/commits/snp-prepare-thp-rfc1
>
> and is based on top of Paolo's kvm-coco-queue-2024-11 tag which includes
> a snapshot of his patches[1] to provide tracking of whether or not
> sub-pages of a huge folio need to have kvm_arch_gmem_prepare() hooks issu=
ed
> before guest access:
>
>   d55475f23cea KVM: gmem: track preparedness a page at a time
>   64b46ca6cd6d KVM: gmem: limit hole-punching to ranges within the file
>   17df70a5ea65 KVM: gmem: add a complete set of functions to query page p=
reparedness
>   e3449f6841ef KVM: gmem: allocate private data for the gmem inode
>
>   [1] https://lore.kernel.org/lkml/20241108155056.332412-1-pbonzini@redha=
t.com/
>
> This series addresses some of the pending review comments for those patch=
es
> (feel free to squash/rework as-needed), and implements a first real user =
in
> the form of a reworked version of Sean's original 2MB THP support for gme=
m.
>

Looking at the work targeted by Fuad to add in-place memory conversion
support via [1] and Ackerley in future to address hugetlb page
support, can the state tracking for preparedness be simplified as?
i) prepare guest memfd ranges when "first time an offset with
mappability =3D GUEST is allocated or first time an allocated offset has
mappability =3D GUEST". Some scenarios that would lead to guest memfd
range preparation:
     - Create file with default mappability to host, fallocate, convert
     - Create file with default mappability to Guest, guest faults on
private memory
ii) Unprepare guest memfd ranges when "first time an offset with
mappability =3D GUEST is deallocated or first time an allocated offset
has lost mappability =3D GUEST attribute", some scenarios that would
lead to guest memfd range unprepare:
     -  Truncation
     -  Conversion
iii) To handle scenarios with hugepages, page splitting/merging in
guest memfd can also signal change in page granularities.

[1] https://lore.kernel.org/kvm/20250117163001.2326672-1-tabba@google.com/
