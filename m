Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D5A7081C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743533233; cv=none; b=Y+LtQ8gDkFu1jtX3M5fhEOoNqPa6pGOv2c8NQQKsFOi2bEeIWTTlwoUEK8h/bqGfC1yI//w8Fr2cwcAmL7KMHYZm+nz8jIOy6R+HyE7cG6uqCu7trd+LBVPYvONGXr4hxBFTDkUasTfZNBlf6+bjrJG7Cy3XZyoF9+u+VI24wtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743533233; c=relaxed/simple;
	bh=3EN8DJcs7vuHrjbWwCn5R8YyQjIag3YYATPkbn9N4q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A9eZdvMmz7ab/UsHNLABabUhUSoTxuzVgzCa9bSjlsg8dh7ZwJefPyRl0W5jApA1QOJhujLsyMFSGYNxNO0kBpLgVEbLCqSmJo4XmeDoepO1MayZdmKe9GCgFk5hy408K0jQqsUN41JsRT08eXR+FoZ3oL3zHzLfQ+q7wi8OHl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njS3Clqr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njS3Clqr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C33C4CEE5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743533233;
	bh=3EN8DJcs7vuHrjbWwCn5R8YyQjIag3YYATPkbn9N4q8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=njS3ClqrxAwUbF4yEnK0hSlwuD8pke6+aclY1bvdFoign+ox83MQzL0zkf/xHlt7F
	 8gIQd6jQP7+KH+wl4i+LMPAmdCRYuAs8VhO9/fPhwwMBlipjrP4CYDAayPp12cOyf6
	 D5Vf/dOXpgrO1XXIt9nPe47LF/BZH3d19y+Gxw7B50PB2apsCFsNawu9Dai/wOIyNs
	 7lNcVyt/xI+KiwVopJfKMHbmsv2hVe+VdTw9f0HxfHV7d8+8BFMmG3jVl/a0U/tvsd
	 tipvav+4fehvAW3dszhjFwq9SmM8N7680prbeVQ0YJUZB+tEPRT1mu8VWSHZVg7iIf
	 epKYMJBGL0y6A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso57371721fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 11:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQ5J/wRQUi8GTQnrsjAnN53EW+hZbDt6ld0sBgAPPk/aeW3d8GeBaj+qAUQxkCPYFmoDkZBwujL7o8/Ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhuphsFOM3PCx0Eh+CqYSun6uMuPlUQVvUg5d5wmeVCSD1+Dje
	VDjU/NQFqqr61Zbz1LzkR0ttTL9B0d2J1Iobm2Nq3l2szNF7j1RdZbI/S6ZkDujhDd1x5NN+sUq
	9pKIVsx6goXyJhi9G02WF75/nEyk=
X-Google-Smtp-Source: AGHT+IFr3N20dboMCQNSF1kAFSfln2FgL3bYPKR5XWRvW3QXmxUfL8Uy/4klpXIcJMEO9FFaB3/1p5pp0rQ4zS5ed3s=
X-Received: by 2002:a05:651c:2209:b0:30c:189d:a169 with SMTP id
 38308e7fff4ca-30de03286edmr44217501fa.25.1743533232123; Tue, 01 Apr 2025
 11:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com> <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 2 Apr 2025 03:46:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
X-Gm-Features: AQ5f1JpWfavKws9pXp40pkcWPQBFSZDj0KKmDcek7l7jzydxtf6KAS-HGpcXERE
Message-ID: <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.15-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Dave Airlie <airlied@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 1:12=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 1 Apr 2025 at 05:21, Jani Nikula <jani.nikula@linux.intel.com> wr=
ote:
> >
> > The header checks have existed for uapi headers before, including the,
> > uh, turds, but apparently adding them in drm broke the camel's back.
>
> The uapi header test things never caused any problems for me [*],
> because they don't actually pollute the source tree.
>
> Why? Because they all end up in that generated 'usr/include/' directory.
>
> So when I look at the source files, filename completion is entirely
> unaffected, and it all works fine.
>
> Look, I can complete something like
>
>     include/uapi/asm-generic/poll.h
>
> perfectly fine, because there is *not* some generated turd that affects i=
t all.
>
> Because for the uapi files those hdrtest files end up being in
>
>     ./usr/include/asm-generic/poll.hdrtest
>
> and I never have any reason to really look at that subdirectory at
> all, since it's all generated.
>
> Or put another way - if I _were_ to look at it, it would be exactly
> because I want to see some generated file, in which case the 'hdrtest'
> turd would be part of it.
>
> (Although I cannot recall that ever having actually happened, to be
> honest - but looking at various header files is common, and I hit the
> drm case immediately)
>
> Would you mind taking more of that uapi approach than creating that
> hidden directory specific to the drm tree? Maybe this could *all* be
> generalized?
>
>            Linus
>
> [*] I say "never caused any problems for me", but maybe it did way in
> the past and it was fixed and I just don't recall. I have definitely
> complained about pathname completion issues to people before.

I know you dislike this, and I NACKed this before (but too late):
https://lore.kernel.org/dri-devel/CAK7LNATHXwEkjJHP7b-ZmhzLfyyuOdsyimna-=3D=
r-sJk+DxigrA@mail.gmail.com/

Compile-testing UAPI headers is useful
(and I believe this is the only case where it is useful)
because userspace is independent of any CONFIG option,
and we have no control over the include order in
userspace programs.

In contrast, kernel-space headers are conditionally parsed,
depending on CONFIG options.

You dislike this feature for the reason of TAB-completion,
but I am negative about this feature from another perspective.

We cannot avoid a false-positive:
https://lore.kernel.org/all/20190718130835.GA28520@lst.de/

It is not <drm/*.h> but <linux/*.h>
However, it is annoying to make every header self-contained
"just because we are checking this".
Actually, it is not a real problem when the relevant
CONFIG option is disabled.
I did not interrupt him because he was doing this
checkunder drivers/gpu/drm/i915/.
()
But, I am opposed to expanding it to more-global include/drm/,
or any other subsystem.

In my opinion, the right fix is
"git revert 62ae45687e43"


If we continue this, maybe leave a caution
in capital letters?


diff --git a/include/Kbuild b/include/Kbuild
index 5e76a599e2dd..4dff23ae51a4 100644
--- a/include/Kbuild
+++ b/include/Kbuild
@@ -1 +1,3 @@
+# The drm subsystem is strict about the self-containedness of header files=
.
+# OTHER SUBSYSTEMS SHOULD NOT FOLLOW THIS PRACTICE.
 obj-$(CONFIG_DRM_HEADER_TEST)  +=3D drm/



--
Best Regards

Masahiro Yamada
