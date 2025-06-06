Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379077D07D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749231272; cv=none; b=NEvPhcUJ3s+NHAz5VrR13Z14tN9vI5uN0vhd1xBq71j99J1wyx7B0U/HCUiGN6Hbr8nwjOHPN1GbrP0EqhdLtHRbboFiLGSKOcyaDk5gbRKoYC25UxRRsVvJzFZgrINi+KPxEEAtLLgrhTj9uBBbw+0KBEfne7OcUFB9E6lFutI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749231272; c=relaxed/simple;
	bh=Lo2sLUU8gajP/2fa2TGn/MAv7u50Q7/UTg9+NcgakJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SzqwrIjsfi1/eU3nioGhRK3K50Mtee1rIxoPpaQ0q1S771lTueStiHTAgPBUf60ECM0Ih2K3Ki79wDTgwSDD0qiccEPl7CT1OGXvZupnIU7bGgxyXgRaUpCDnKb84CA2FerUWy0uXHhh2OmWFNnMRfjzBEuFP5B7PcfavMay5qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=XxeyvBj6; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="XxeyvBj6"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso3734702a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 10:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1749231268; x=1749836068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lo2sLUU8gajP/2fa2TGn/MAv7u50Q7/UTg9+NcgakJ4=;
        b=XxeyvBj6O4jxUxuFT27YlZT3WpVSmDWEt/MrTZNgLLFwNnbILUpioTwd+KaUIx/Dam
         kmp5yjpLIWn+bfqbH0jqlEDYAU+RWlvwrn2DQukHubmKUcTVg15DdpAXJDlx6K3uiKaA
         txdKDmQXeEwxt2Au+2QeQQR+gnGSNdpAq6VSaEAGCVteLBbXFk0bvd9UvjOj/NMvVMAp
         XN+W/+aEvcrm8F9h4ybaSzN2ubND8i8llOF+Ti20JspWBODN8L8FUbPpHQ9hSOKIGvfl
         M6ZB3fibPW8WqrNU9IYfaKva+Y97XhTbBJ48snQVaTkDVzU9jBEeskMsiECHyQY6pBU3
         Wvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749231268; x=1749836068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lo2sLUU8gajP/2fa2TGn/MAv7u50Q7/UTg9+NcgakJ4=;
        b=orqYsHEQmXIsqECc++Ze42n95/Xm0LDhmL84puEs/yEOGI0A3zvEKSkWJB75sL7VvO
         apIX5G3L044EK/jTxT0zerZiBQkbsupcwkTNIVmQa1D/9EU30Pqz/Dc6dgOab8wUb9BY
         pg+/EyjXymVZb5+ZLtBE41T2kB/e+Ghrua3QYsFyDXseyza1rR8tiRMsH3EVI6HdCgi0
         kFq0yDnBmqHzLKvqmfF+Yej63qubavMTAFFhFwqo2COa8MVzfiZ11BdTsfjNUtpm4Wdg
         HGBgZnnKWLe7N2rMP/FzKc2NR/0rOBtl4koeMipYFyesCZGebh0Zu9kJQ0ZYgnmOe33v
         1/Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXg74OX/yjD8/fpByHM7VxuC39GSaUPli9D4lbtItPYCSw1haoQcNx33Qvgzvs469BRdTeq0huEmlu1SFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj6uaDCQmHiPOOQKUzX+p2bQgwVrwC8bWn0atyELAylZxnxm/2
	D/2omXaSBt7bvyS5A5ud2ib66hUw3BIb09qnMlShGqJENiwDYglq8Zzg2yFfZ0WBP6lPb71dob/
	2u07XiH5p9Hck8hKca0BbWcC9i6dy54WgojzRg0eXhA==
X-Gm-Gg: ASbGnctQLoi7qZ53lk5iR5NjTcHvdZz989ZO7fFyMHPXzsh79XS2K8KOS4KYMU6nhnV
	oI8BoJnC4Xoy8JxUbZLFLmUMtdSOLn79JqulHKEwDHfYiY5gm16+p/BWfYcfyzjxcVAgwpnug6M
	p2CU0Fev+BmQSr7ubgxPe+8+/6YEG5f3YwKOTl5+3C4GRzxGP/1rU2J1QBf3baUXy3Sd44Euv3
X-Google-Smtp-Source: AGHT+IFCETrTEmcPHz0ACqWVc876pXPxxfTtH+owoz2M0LztCGhL/1O23PMi+ver8XH+7oQ+N3Hc2WCimzLR1FZJO0A=
X-Received: by 2002:a17:907:970f:b0:adb:428f:f735 with SMTP id
 a640c23a62f3a-ade1aa5cfeamr398755266b.12.1749231268512; Fri, 06 Jun 2025
 10:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206165014.165614-1-max.kellermann@ionos.com>
 <CAKPOu+8eQfqJ9tVz-DzDzqKPEtQVCooxtxe1+OZanu5gi3oQzQ@mail.gmail.com>
 <CAOi1vP-dARssCkj-2FiKDJLRv9+Dq+_GE3pfQy4BseF_8sjUNQ@mail.gmail.com> <b4ac9be24677c76a04c99aab04f572abaa4cf8af.camel@ibm.com>
In-Reply-To: <b4ac9be24677c76a04c99aab04f572abaa4cf8af.camel@ibm.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Fri, 6 Jun 2025 19:34:16 +0200
X-Gm-Features: AX0GCFuX9_ACdlLmbK9HuAeYg9WTPGsECRMNei5y1frnMXhguGJU97HHePkE5gQ
Message-ID: <CAKPOu+9GHo3_Uf+b_8-p0Hg=gdJJnRE62Go9UZz9WHqR6WF5Lw@mail.gmail.com>
Subject: Re: [PATCH] fs/ceph/io: make ceph_start_io_*() killable
To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Cc: "idryomov@gmail.com" <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, 
	Alex Markuze <amarkuze@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 7:15=E2=80=AFPM Viacheslav Dubeyko <Slava.Dubeyko@ib=
m.com> wrote:
> I see the point. Our last discussion has finished with statement that Max
> doesn't care about this patch set and we don't need to pick it up. If he =
changed
> his mind, then I can return to the review of the patch. :) My understandi=
ng was
> that he prefers another person for the review. :) This is why I keep sile=
nce.

I do care, always did. I answered your questions, but they were not
really about my patch but about whether error handling is necessary.
Well, yes, of course! The whole point of my patch is to add an error
condition that did not exist before. If locking can fail, of course
you have to check that and propagate the error to the caller (and
unlocking after a failed lock of course leads to sorrow). That is so
trivial, I don't even know where to start to explain this if that
isn't already obvious enough.

If you keep questioning that, are you really qualified to do a code review?

Max
