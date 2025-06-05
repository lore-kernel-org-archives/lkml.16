Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C051917FB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749135368; cv=none; b=Auk/1zFMcZEE9iuM/W2dEZFD4ST4TQcZmUusQNqH8qPItz5prQ+RVGvtU9xbj8t4v8G9psW361hYJv29wjFxXO3YSQxc7U/gls+8mjSO4+q5BeTF+I1/CjS9JaGVIpldh1Hh6qpghLhhh6nlD6kXzVgskaKEwQGoaYpDTfzzdWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749135368; c=relaxed/simple;
	bh=DHu18rmA0sU7oZNUXhtODTBETFCDhL2OEUU38uuVFxI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gD2SRW0I90JJNyBnYhjOHHgS/4vrCXW81rRHGVnG6oXXsuAb3T5QYvTaozzqp2zwm3W3snm93+BlofA+Ybx7MnZnx4WUXENcPHD2P8B5E1y92/tZy4fUftY9CCmeuShWWusMh6LcTpcMkwrqGUXx4yWlB6xb2KNOoRD61KvBGko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=StUukNQL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="StUukNQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749135365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFA6j3WG2u6wCRFKF+JPzUGEfqC8djtrecvjhVi86Lo=;
	b=StUukNQL108Y6Evi54eeZAqEf18d4Ah++jZclxB90nls9Cx2LO3Id54Q5fpM1Abt8KkR3g
	xIHgdK7RIc94+17ieDu9KEyfwS+qP5SFsOFP5P2JQ66yOz4fjEcXd/E63sXh6J4NoWV17J
	4kFE72t9uhzrHdicn+pCWUxkUEHEivc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-A9OwAmGPNeOMvqs4Yz2yVA-1; Thu, 05 Jun 2025 10:56:04 -0400
X-MC-Unique: A9OwAmGPNeOMvqs4Yz2yVA-1
X-Mimecast-MFC-AGG-ID: A9OwAmGPNeOMvqs4Yz2yVA_1749135363
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d30992bcso9146655e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 07:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135363; x=1749740163;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFA6j3WG2u6wCRFKF+JPzUGEfqC8djtrecvjhVi86Lo=;
        b=oGyHDOsz850zUZBjwpLPcEWPYoU6YUWd43OUHw54jam1hqtrhh1Lg752HNmm6JPdPw
         ts2sKxZ+ne/HdgkCNVb3S+Q/uSuAc7fZ9YYEbbZpm+eAjN/MMau2d3eyxkhylpcb0IKB
         g4jWGmtWjDehvNW4Tpyxkur6tz2eEM2Qwo8hHV+OLeuYjL2YRVxAHWe77TCoI1OsfpGC
         A6A1y6nGMOWzgc05Vln+ZrcKuZXFFeEVPEc1zChvyXeC3qT0FDeXlT9jLZJMEEXelpGe
         vk41KzKjcS7vUQD9+WVbGLoFtZ2nzPVxx3oV70bkRjATMtI3gPXFSJbcOrEk9aJPis2Y
         9YoA==
X-Forwarded-Encrypted: i=1; AJvYcCWF9up1ZLnzoigDtjnIGvWEI/8cZG14EhoiLrvVx2jz4sM9RAN6A3GvoghTBC8VmJq+iaxT6RaLd5I6gDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoERMUvG0cRuS/PLnKIgWsVlUby/BFcGP6okGKCBSc/QKh+E1+
	3up2PG2NdxjegDNIYoiVDmu5+ZB+p2F2T7CiBimaZC3PFqXR7aXdmy1H8PmyxBaxxJD8Edte6I2
	eBs6uinqsdFJqtmGOJd5wsQM7E7ndW31yQQtoFsfPhyXOpLKJI/T+JFO81/wzxUfrlQ==
X-Gm-Gg: ASbGncsh2rdo+oc2eFHL9VT+KssZZC29inF8PvNAKaQ1sAJOwTprPIuScZAHMUjEwpr
	BUwvfRY41jtxlLE1au7X3yRdUwxWZj/hjSUu4iapFdE0tMEUDcMXHVz0Us5f9W2yncrlK9TpXpH
	J4VbecUxXGDhFNoqb7bjTm2FliILWn0EN4qgjOqGyNRZTwNDPfg2xwWzGjWen8IQ+ciqGQsEZZQ
	8qS3/nWehnptyrAdBqVebg+sMIW3vHmd0rK92qVdAW6FZVPxBMgSAdd+8Vi50X7LFiMaBS7BhlQ
	mbFr8Hcj5o120SqzSQ==
X-Received: by 2002:adf:e38c:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a52670e28dmr3061234f8f.32.1749135362779;
        Thu, 05 Jun 2025 07:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA81c6wZglVzh0Z3/rZiV4JQo/XmLeKsTiTnUWO5wj0USvJJ+iJpt9siQ/hlalGpRgG5o3Zw==
X-Received: by 2002:adf:e38c:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a52670e28dmr3061215f8f.32.1749135362368;
        Thu, 05 Jun 2025 07:56:02 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm27314005e9.23.2025.06.05.07.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 07:56:02 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Eric Snowberg <eric.snowberg@oracle.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, "linux-integrity@vger.kernel.org"
 <linux-integrity@vger.kernel.org>, "linux-modules@vger.kernel.org"
 <linux-modules@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "keyrings@vger.kernel.org"
 <keyrings@vger.kernel.org>, David Howells <dhowells@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Sami
 Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu
 <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge
 E. Hallyn" <serge@hallyn.com>, Peter Jones <pjones@redhat.com>, Robert
 Holmes <robeholmes@gmail.com>, Jeremy Cline <jcline@redhat.com>, Coiby Xu
 <coxu@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH RFC 0/1] module: Optionally use .platform keyring for
 signatures verification
In-Reply-To: <435F53C6-DC08-49CA-AA36-9747FC1B50DF@oracle.com>
References: <20250602132535.897944-1-vkuznets@redhat.com>
 <0FD18D05-6114-4A25-BD77-C32C1D706CC3@oracle.com>
 <f0b37bc55ed3c02569c74f0fbdb6afa8efd329e2.camel@HansenPartnership.com>
 <87zfemoc76.fsf@redhat.com>
 <435F53C6-DC08-49CA-AA36-9747FC1B50DF@oracle.com>
Date: Thu, 05 Jun 2025 16:56:00 +0200
Message-ID: <87qzzynsov.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Eric Snowberg <eric.snowberg@oracle.com> writes:

>> On Jun 5, 2025, at 1:54=E2=80=AFAM, Vitaly Kuznetsov <vkuznets@redhat.co=
m> wrote:
>>=20
>> 'certwrapper' offers _a_ solution which is great. It may, however, not
>> be very convenient to use when a user wants to re-use the same OS image
>> (e.g. provided by the distro vendor) for various different use-cases as
>> proper 'certwrapper' binary needs to be placed on the ESP (and thus
>> we'll end up with a bunch of images instead of one). 'db' is different
>> because it normally lives outside of the OS disk so it is possible to
>> register the exact same OS image with different properties (e.g. with
>> and without a custom cert which allows to load third party modules).
>
> Could you please provide more details? The kernel module is signed with=20
> a specific key. The =E2=80=98db=E2=80=99  key in the cloud image must mat=
ch whatever key=20
> was used to sign the kernel module.
>
> Why can=E2=80=99t the RPM package that contains the kernel module also in=
clude=20
> the required =E2=80=98certwrapper=E2=80=99?  When the RPM is installed, t=
he appropriate=20
> =E2=80=98certwrapper=E2=80=99 is placed on the ESP.  There can be any num=
ber of 'certwrappers'=20
> in the ESP. Doesn=E2=80=99t this solution address the issue?

I think it does but let me elaborate on where I believe some (minor?)
inconvenience comes from.

We have various actors here:
1) The OS image which is coming from a distro vendor.

2) The user, which takes the OS image and registers it with specific
properties (including 'db') with various infrastructures (e.g. different
clouds).

3) A third party kmod vendor which produces a module compatible with the
OS version. The module may only make sense for certain VMs on certain
clouds.

The customization of the VM normally happens upon first boot: a generic
image from the OS vendor (1) boots and then some provisioning agent
(cloud-init, WALA,...) takes over and e.g. installs additional
stuff. This additional stuff may include third party kmods from (3).

The 'certwrapper' must carry the key which the third party vendor (3) uses
and it must be signed by a key which the user (2) put to the 'db'. If we
want to have the 'certwrapper' shipped inside the same RPM as the kernel
module, it will be signed by the same third party vendor (3). While this
looks a bit weird ('self-signed certwrapper'), I don't see why this
can't work.=20

Besides the need to teach (3) how to build certwrappers, an inconvenience
in this scheme comes from the fact that to activate a 'certwrapper'
which we install from a custom rpm, we need a reboot. Cloud instances
often back burstable workloads and this can be seen as annoyance.

--=20
Vitaly

